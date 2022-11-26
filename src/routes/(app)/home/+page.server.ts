import { invalid, type Actions } from '@sveltejs/kit';

import { createTooeat, deleteTooeat, getTooeats, likeTooeat } from '$root/utils/prisma';

export const load = async ({ locals }) => {
  const { user } = await locals.getSessionUser();
  const tooeats = await getTooeats(user);

  if (!tooeats) {
    return invalid(400);
  }

  return {
    tooeats,
  };
};

export const actions: Actions = {
  createTooeat: async ({ request, locals }) => {
    const form = await request.formData();
    const tooeat = String(form.get('tooeat'));

    // TODO: use a validation library
    if (tooeat.length > 280) {
      return invalid(400, { tooeat, incorrect: true });
    }
    const { user } = await locals.getSessionUser();

    await createTooeat(tooeat, user);

    return {};
  },
  deleteTooeat: async ({ request }) => {
    const form = await request.formData();
    const tooeatId = +(form.get('id') || 0);

    if (!tooeatId) return invalid(400);

    await deleteTooeat(tooeatId);

    return {};
  },
  likeTooeat: async ({ request, locals }) => {
    const form = await request.formData();
    const id = +(form.get('id') || 0);

    if (!id) return invalid(400);

    const { user } = await locals.getSessionUser();
    if (!user?.userId) return invalid(400);

    await likeTooeat(id, user);

    return {};
  },
};
