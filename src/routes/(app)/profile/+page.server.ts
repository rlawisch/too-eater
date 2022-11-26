import { redirect } from '@sveltejs/kit';

// Redirect to user profile
export const load = async ({ locals }) => {
  const { user } = await locals.getSessionUser();
  throw redirect(302, `/profile/${user?.handle}`);
};
