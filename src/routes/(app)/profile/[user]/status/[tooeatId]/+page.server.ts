import { getTooeat } from '$root/utils/prisma';
import { invalid } from '@sveltejs/kit';

export const load = async ({ params, locals }) => {
  const { user } = await locals.getSessionUser();
  const tooeat = await getTooeat(params.tooeatId, user.userId);

  if (!tooeat) return invalid(400);

  return tooeat;
};
