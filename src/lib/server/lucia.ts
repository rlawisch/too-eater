import lucia from 'lucia-auth';
import prisma from '@lucia-auth/adapter-prisma';
import { PrismaClient } from '@prisma/client';

const client = new PrismaClient();

const dev = 'DEV';

export const auth = lucia({
  adapter: prisma(client),
  env: dev ? 'DEV' : 'PROD',
  transformUserData: (userData) => {
    return {
      userId: userData.id,
      email: userData.email,
      handle: userData.handle,
      name: userData.name,
      avatar: userData.avatar,
      about: userData.about,
    };
  },
});

export type Auth = typeof auth;
