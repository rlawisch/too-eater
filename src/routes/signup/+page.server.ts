import { invalid, redirect, type Actions } from '@sveltejs/kit';
import { auth } from '$lib/server/lucia';
import type { PageServerLoad } from './$types';

// If the user exists, redirect authenticated users to the feed page.
export const load: PageServerLoad = async ({ locals }) => {
  const session = await locals.getSession();
  if (session) throw redirect(302, '/home');
  return {};
};

export const actions: Actions = {
  default: async ({ request, locals }) => {
    const form = await request.formData();
    const email = form.get('email');
    const handle = form.get('handle');
    const password = form.get('password');
    const name = form.get('name');
    const about = form.get('about');
    const avatar = form.get('avatar');
    const banner = form.get('banner');
    // check for empty values
    if (
      !email ||
      !handle ||
      !password ||
      !name ||
      typeof email !== 'string' ||
      typeof handle !== 'string' ||
      typeof password !== 'string' ||
      typeof name !== 'string' ||
      typeof about !== 'string' ||
      typeof avatar !== 'string' ||
      typeof banner !== 'string'
    ) {
      return invalid(400);
    }
    try {
      const user = await auth.createUser('handle', handle, {
        password,
        attributes: {
          email,
          handle,
          name,
          avatar,
          banner,
          about,
        },
      });
      const session = await auth.createSession(user.userId);
      locals.setSession(session);
    } catch (err) {
      // email or handle already in use
      return invalid(400);
    }
  },
};
