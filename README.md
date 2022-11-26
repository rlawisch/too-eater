# 🍕 Too-eater

This well-humored Twitter clone was made to fulfill the requisites of the final coursework from Databases for Engineering course of Universidade do Vale do Rio dos Sinos (UNISINOS), which are:

- **Use an oriented-object language:** [TypeScript](https://www.typescriptlang.org/) provides all the bells and whistles that simplified the making of this project.
- **Use a relational database system:** [PostgreSQL](https://www.postgresql.org/) is the chosen relational DB.
- **Have some kind of interface (terminal, web, GUI, etc):** The web interface is done in [Svelte](https://svelte.dev/) usign the awesome [SvelteKit](https://kit.svelte.dev/) meta-framework.
- **Use at least one database view:** Besides currently not being displayed, there are views for showing which accounts an user follows, which accounts are following that user and which accounts are suggested for an user to follow (the 2 accounts most followed by accounts that user follows).
- **Use at least one database trigger:** There are two, one for when a Too-eat is liked, other for when a Too-eat is disliked. Both have the function of updating the `likes` count field of that Too-eat.
- **Use at least one database `CHECK` restriction:** Database enforces that Too-eat have at most 280 characters.
- **Implement CRUD functions (ORMs may be used):** We can create, read and delete Too-eats, and the update is done by the triggers when we hit the `like` button. [Prisma](https://www.prisma.io/) provides the ORM support with all the type safety TypeScript can offer.

## Installing and running

Clone the repository and run the JS package installer of your choice ([PNPM](https://pnpm.io/) was used, but NPM and Yarn work just as fine. Create a `.env` file containing the connection string to match your PostgreSQL configuration (or rename and edit `.env.example`). Then, run the `dev` script:

```bash
pnpm i
echo "DATABASE_URL=\"postgresql://username:password@host:5432/database?schema=public\"" >> .env
pnpm run dev
```

## Contributing

This project have lots of room for improvements, and some small bugfixes and enhancements to be done (mostly cosmetic, which were lower-priority when the deadline approached). Adding support to following other users is probably the next step (most of the backend is ready for that, although as of Nov. 2022 Prisma still doesn't offer official support for database views), but you can use your imagination here.
If you changed/fixed something you think was cool, don't hesitate to put up a PR, which I'll hapilly review.
