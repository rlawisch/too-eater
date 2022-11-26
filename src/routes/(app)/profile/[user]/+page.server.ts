import { getUserProfile } from '$root/utils/prisma';

export const load = async ({ params }) => {
  return await getUserProfile(params.user);
};
