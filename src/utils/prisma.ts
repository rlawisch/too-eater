import prisma from '$root/lib/prisma';
import { timePosted } from '$root/utils/date';

export async function getTooeats(user) {
  const tooeats = await prisma.tooeat.findMany({
    include: { user: true },
    orderBy: { posted: 'desc' },
  });

  const likedTooeats = await getLikedTooeats(user);

  return tooeats.map((tooeat) => {
    return {
      id: tooeat.id,
      content: tooeat.content,
      likes: tooeat.likes,
      posted: timePosted(tooeat.posted),
      url: tooeat.url,
      avatar: tooeat.user.avatar,
      handle: tooeat.user.handle,
      name: tooeat.user.name,
      liked: likedTooeats.includes(tooeat.id),
    };
  });
}

export async function getTooeat(tooeatUrl: string, userId: string) {
  const tooeat = await prisma.tooeat.findFirst({
    where: { url: tooeatUrl },
    include: { user: true },
  });

  if (!tooeat) return;

  const liked = await prisma.liked.findFirst({
    where: { tooeatId: tooeat.id, userId: userId },
    select: { tooeatId: true },
  });

  const userTooeat = {
    id: tooeat.id,
    content: tooeat.content,
    likes: tooeat.likes,
    posted: timePosted(tooeat.posted),
    url: tooeat.url,
    avatar: tooeat.user.avatar,
    handle: tooeat.user.handle,
    name: tooeat.user.name,
    liked: !!liked,
  };

  return {
    tooeat: userTooeat,
  };
}

export async function getLikedTooeats(user) {
  // get the liked too-eats
  const liked = await prisma.liked.findMany({
    where: { userId: user?.userId },
    select: { tooeatId: true },
  });

  // maps into an array of the ids
  return Object.keys(liked).map((key) => liked[key].tooeatId);
}

export async function createTooeat(tooeat: string, user) {
  await prisma.tooeat.create({
    data: {
      posted: new Date(),
      url: Math.random().toString(16).slice(2),
      content: tooeat,
      likes: 0,
      user: { connect: { id: user?.userId } },
    },
  });
}

export async function deleteTooeat(tooeatId: number) {
  await prisma.tooeat.delete({ where: { id: tooeatId } });
}

export async function likeTooeat(tooeatId: number, user) {
  const liked = await prisma.liked.findFirst({
    where: { tooeatId: tooeatId, userId: user.userId },
  });

  if (liked) {
    await prisma.liked.delete({
      where: { tooeatId_userId: { tooeatId: tooeatId, userId: user.userId } },
    });
  } else {
    await prisma.liked.create({
      data: {
        tooeatId: tooeatId,
        user: { connect: { id: user.userId } },
      },
    });
  }
}

export async function getUserProfile(userHandle: string) {
  const profile = await prisma.user.findFirst({
    where: { handle: userHandle },
  });

  const tooeats = await prisma.tooeat.findMany({
    where: { user: { id: profile?.id } },
    include: { user: true },
    orderBy: { posted: 'desc' },
  });

  const liked = await prisma.liked.findMany({
    where: { userId: profile?.id },
    select: { tooeatId: true },
  });

  const likedTooeats = Object.keys(liked).map((key) => liked[key].tooeatId);

  if (!profile || !tooeats || tooeats.length === 0) {
    return { status: 404 };
  }

  const userTooeats = tooeats.map((tooeat) => {
    return {
      id: tooeat.id,
      content: tooeat.content,
      likes: tooeat.likes,
      posted: timePosted(tooeat.posted),
      url: tooeat.url,
      avatar: tooeat.user.avatar,
      handle: tooeat.user.handle,
      name: tooeat.user.name,
      liked: likedTooeats.includes(tooeat.id),
    };
  });

  return {
    profile,
    tooeats: userTooeats,
  };
}
