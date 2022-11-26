import { invalid, redirect } from '@sveltejs/kit';
import { auth } from '$lib/server/lucia';
import type { PageServerLoad, Actions } from './$types';

// If the user exists, redirect authenticated users to the feed page.
export const load: PageServerLoad = async ({ locals }) => {
  const session = await locals.getSession();
  if (session) throw redirect(302, '/home');
};

export const actions: Actions = {
  default: async ({ request, locals }) => {
    const form = await request.formData();
    const username = form.get('handle');
    const password = form.get('password');
    // check for empty values
    if (!username || !password || typeof username !== 'string' || typeof password !== 'string')
      return invalid(400);
    try {
      const user = await auth.authenticateUser('handle', username, password);
      const session = await auth.createSession(user.userId);
      locals.setSession(session);
    } catch {
      // invalid credentials
      return invalid(400);
    }
  },
};
