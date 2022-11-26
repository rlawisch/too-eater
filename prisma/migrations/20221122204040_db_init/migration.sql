-- CreateTable
CREATE TABLE "user" (
  "id" TEXT NOT NULL,
  "email" TEXT NOT NULL,
  "handle" TEXT NOT NULL,
  "provider_id" TEXT NOT NULL,
  "hashed_password" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "avatar" TEXT NOT NULL,
  "banner" TEXT NOT NULL,
  "about" TEXT NOT NULL,

  CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "session" (
  "id" TEXT NOT NULL,
  "user_id" TEXT NOT NULL,
  "expires" BIGINT NOT NULL,
  "idle_expires" BIGINT NOT NULL,

  CONSTRAINT "session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tooeat" (
  "id" SERIAL NOT NULL,
  "url" TEXT NOT NULL,
  "posted" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "content" TEXT NOT NULL CHECK (char_length(content) <= 280),
  "likes" INTEGER NOT NULL DEFAULT 0,
  "userId" TEXT NOT NULL,

  CONSTRAINT "Tooeat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Liked" (
  "id" SERIAL NOT NULL,
  "tooeatId" INTEGER NOT NULL,
  "userId" TEXT NOT NULL,

  CONSTRAINT "Liked_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Followed" (
  "id" SERIAL NOT NULL,
  "followerId" TEXT NOT NULL,
  "followedId" TEXT NOT NULL,

  CONSTRAINT "Followed_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_handle_key" ON "user"("handle");

-- CreateIndex
CREATE UNIQUE INDEX "user_provider_id_key" ON "user"("provider_id");

-- CreateIndex
CREATE UNIQUE INDEX "session_id_key" ON "session"("id");

-- CreateIndex
CREATE INDEX "session_user_id_idx" ON "session"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Liked_tooeatId_userId_key" ON "Liked"("tooeatId", "userId");

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tooeat" ADD CONSTRAINT "Tooeat_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Liked" ADD CONSTRAINT "Liked_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Followed" ADD CONSTRAINT "Followed_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Followed" ADD CONSTRAINT "Followed_followedId_fkey" FOREIGN KEY ("followedId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- InsertData
INSERT INTO "user"
  ("id", "email", "handle", "provider_id", "hashed_password", "name", "avatar", "banner", "about")
VALUES
  ('clatwufkw0000ud8go3qfhzpa', 'lawisch.nh@gmail.com', 'lawisch', 'handle:lawisch',
   'YDP9Kh36yeQkAkAq:42f7b27196e5a809dd4b8b6b7d696a509c6ecba2135a61f059d65892009f33bc5270b9e14f5a730f5f2804063d916270c9001f200932ad6e651c812f5816ca99',
   'Rafael Lawisch', 'https://media-exp1.licdn.com/dms/image/C4E03AQFnFewEWXArRA/profile-displayphoto-shrink_800_800/0/1638058836394?e=2147483647&v=beta&t=Aj07PdLvh2QYNCjjzalSbsnqyIHBzc7UFXuu5DIKwfI',
   'https://images2.alphacoders.com/113/1133707.jpg',
   'Just a cool programmer guy :)'),
  ('clav6vmeu000008li5mh2g748', 'neymar@gmail.com', 'neymarjr', 'handle:neymarjr',
   'YDP9Kh36yeQkAkAq:42f7b27196e5a809dd4b8b6b7d696a509c6ecba2135a61f059d65892009f33bc5270b9e14f5a730f5f2804063d916270c9001f200932ad6e651c812f5816ca99',
   'Menino Ney', 'https://pbs.twimg.com/profile_images/1590849874429460481/lO4dvw0c_400x400.jpg',
   'https://pbs.twimg.com/profile_banners/158487331/1666031380/600x200',
   'Filho de Deus, Pai, Feliz e Ousado !'),
  ('clav6xpe0000108li3yow6pid', 'elonmusk@gmail.com', 'elonmusk', 'handle:elonmusk',
   'YDP9Kh36yeQkAkAq:42f7b27196e5a809dd4b8b6b7d696a509c6ecba2135a61f059d65892009f33bc5270b9e14f5a730f5f2804063d916270c9001f200932ad6e651c812f5816ca99',
   'Elon Musk', 'https://pbs.twimg.com/profile_images/1590849874429460481/lO4dvw0c_400x400.jpg',
   'https://pbs.twimg.com/profile_banners/44196397/1576183471/600x200',
   ' '),
  ('clav74sgg000008mj2fkn3vi4', 'bezos@gmail.com', 'JeffBezzos', 'handle:JeffBezzos',
   'YDP9Kh36yeQkAkAq:42f7b27196e5a809dd4b8b6b7d696a509c6ecba2135a61f059d65892009f33bc5270b9e14f5a730f5f2804063d916270c9001f200932ad6e651c812f5816ca99',
   'Jeff Bezos', 'https://pbs.twimg.com/profile_images/1591558315254890500/ETIHb4Nl_400x400.jpg',
   'https://pbs.twimg.com/profile_banners/15506669/1448361938/600x200',
   'Amazon. Blue Origin. Washington Post. Bezos Earth Fund. Bezos Academy.'),
  ('clav79zat000108mj2306h1nz', 'Marcel@BasicallyIDoWrk.com', 'BasicallyIDoWrk', 'handle:BasicallyIDoWrk',
   'YDP9Kh36yeQkAkAq:42f7b27196e5a809dd4b8b6b7d696a509c6ecba2135a61f059d65892009f33bc5270b9e14f5a730f5f2804063d916270c9001f200932ad6e651c812f5816ca99',
   'Marcel', 'https://pbs.twimg.com/profile_images/1521323077002358784/9xoB02yZ_400x400.jpg',
   'https://pbs.twimg.com/profile_banners/567167802/1666224498/600x200',
   'Professional Superstar Internet Sensation.'),
  ('clav7fd0y000208mjfi8f1qmv', 'maruf@gmail.com', 'M3aruf', 'handle:M3aruf',
   'YDP9Kh36yeQkAkAq:42f7b27196e5a809dd4b8b6b7d696a509c6ecba2135a61f059d65892009f33bc5270b9e14f5a730f5f2804063d916270c9001f200932ad6e651c812f5816ca99',
   'Maruf', 'https://pbs.twimg.com/profile_images/1117889461994577921/txGQaTlh_400x400.jpg',
   'https://pbs.twimg.com/profile_banners/520425571/1658871307/600x200',
   'Snoop Dogg retweeted my meme once'),
  ('clav928hi000008mm9kl837fa', 'marcus@gmail.com', 'marcusthetoken', 'handle:marcusthetoken',
   'YDP9Kh36yeQkAkAq:42f7b27196e5a809dd4b8b6b7d696a509c6ecba2135a61f059d65892009f33bc5270b9e14f5a730f5f2804063d916270c9001f200932ad6e651c812f5816ca99',
   'Marcus A. Stricklin', 'https://pbs.twimg.com/profile_images/1350186416462942208/mZiKPA1K_400x400.jpg',
   'https://pbs.twimg.com/profile_banners/128897080/1621547049/600x200',
   'husband. dad. tv writer. Tweets reflect the opinion of my employer lol. Top 25 writer to watch 2022. Warnermedia x abff 2021 comedy pilot winner 2021'),
  ('clav97m8v000008mfd4mxgbz0', 'dylan@gmail.com', 'dfarella', 'handle:dfarella',
   'YDP9Kh36yeQkAkAq:42f7b27196e5a809dd4b8b6b7d696a509c6ecba2135a61f059d65892009f33bc5270b9e14f5a730f5f2804063d916270c9001f200932ad6e651c812f5816ca99',
   'Dylan Farella', 'https://pbs.twimg.com/profile_images/1046580161045389313/xhiiCGUf_400x400.jpg',
   'https://pbs.twimg.com/profile_banners/260036035/1538359373/600x200',
   'Storyteller. Jedi.'),
  ('clavqcg4o000008jzh2xp7elz', 'carrot@gmail.com', 'RealCarrotFacts', 'handle:RealCarrotFacts',
   'YDP9Kh36yeQkAkAq:42f7b27196e5a809dd4b8b6b7d696a509c6ecba2135a61f059d65892009f33bc5270b9e14f5a730f5f2804063d916270c9001f200932ad6e651c812f5816ca99',
   'Carrot Facts', 'https://pbs.twimg.com/profile_images/3087487761/d755aacbb886a1ccb21bf1879a888b1a_400x400.jpeg',
   'https://pbs.twimg.com/profile_images/1046580161045389313/xhiiCGUf_400x400.jpg',
   'Carrot is one of the most famous vegetable in the world.'),
  ('clavqcn92000108jz1grphjx2', 'jesuspizza@gmail.com', 'shitfoodblogger', 'handle:shitfoodblogger',
   'YDP9Kh36yeQkAkAq:42f7b27196e5a809dd4b8b6b7d696a509c6ecba2135a61f059d65892009f33bc5270b9e14f5a730f5f2804063d916270c9001f200932ad6e651c812f5816ca99',
   'Jesus Pizza', 'https://pbs.twimg.com/profile_images/1523485504238497796/odzpgJQL_400x400.jpg',
   'https://pbs.twimg.com/profile_banners/582317702/1627054905/600x200',
   'co-host carbfacepod with lauriewoolever. negroni, parchment and slaw influencer.');

-- InsertData
INSERT INTO "Tooeat"
  ("url", "posted", "content", "likes", "userId")
VALUES
  ('b940f3984d7a3', '2022-11-23T17:19:35.369Z', 'This is my first Too-eat!', 0, 'clatwufkw0000ud8go3qfhzpa'),
  ('77f289c489bcd', '2022-11-23T17:19:51.066Z', 'I hope more people join us', 0, 'clatwufkw0000ud8go3qfhzpa'),
  ('a82047bde9238', '2011-06-22T18:34:51.066Z', 'To chegando com os refrii rapaziada', 7, 'clav6vmeu000008li5mh2g748'),
  ('983489abc87ed', '2022-11-24T11:32:50.562Z', 'Migrating to here after my bought social network collapsed', 1, 'clav6xpe0000108li3yow6pid'),
  ('efd9285ab9238', '2022-11-24T11:35:55.562Z', 'I like it here. Might bought before the other guy thinks of ruining here too', 1, 'clav74sgg000008mj2fkn3vi4'),
  ('efd69378cbab8', '2021-05-31T05:54:55.222Z', 'I just made a triple stack quesadilla. Just wanted you all to know. Don''t let your dreams be dreams.', 2, 'clav79zat000108mj2306h1nz'),
  ('1f2293876fab8', '2020-08-13T06:04:22.472Z', E'me: i''ll make omelette\n\n*flips the omelette*\n\nme: i''ll make scrambled egg', 3, 'clav7fd0y000208mjfi8f1qmv'),
  ('986bc87fae095', '2011-07-18T05:09:22.472Z', E'Food delivery is a combination of my three favorite things:\n1. Food\n2. Not moving\n3. Avoiding people', 5, 'clav928hi000008mm9kl837fa'),
  ('af69de9fb6dae', '2019-02-05T10:09:11.632Z', E'2:00pm: Gonna save the other half of this sandwich for later\n\n2:06pm: Time to finish that sandwich', 2, 'clav97m8v000008mfd4mxgbz0');

-- InsertData
INSERT INTO "Liked"
  ("tooeatId", "userId")
VALUES
  (3, 'clatwufkw0000ud8go3qfhzpa'),
  (3, 'clav6xpe0000108li3yow6pid'),
  (3, 'clav74sgg000008mj2fkn3vi4'),
  (3, 'clav79zat000108mj2306h1nz'),
  (3, 'clav7fd0y000208mjfi8f1qmv'),
  (3, 'clav928hi000008mm9kl837fa'),
  (3, 'clav97m8v000008mfd4mxgbz0'),
  (4, 'clav74sgg000008mj2fkn3vi4'),
  (5, 'clav6xpe0000108li3yow6pid'),
  (6, 'clatwufkw0000ud8go3qfhzpa'),
  (6, 'clav928hi000008mm9kl837fa'),
  (7, 'clav79zat000108mj2306h1nz'),
  (7, 'clav928hi000008mm9kl837fa'),
  (7, 'clav97m8v000008mfd4mxgbz0'),
  (8, 'clav6xpe0000108li3yow6pid'),
  (8, 'clav79zat000108mj2306h1nz'),
  (8, 'clav7fd0y000208mjfi8f1qmv'),
  (8, 'clav97m8v000008mfd4mxgbz0'),
  (8, 'clatwufkw0000ud8go3qfhzpa'),
  (9, 'clav7fd0y000208mjfi8f1qmv'),
  (9, 'clatwufkw0000ud8go3qfhzpa');

-- InsertData
INSERT INTO "Followed"
  ("followerId", "followedId")
VALUES
  ('clatwufkw0000ud8go3qfhzpa', 'clav6vmeu000008li5mh2g748'),
  ('clatwufkw0000ud8go3qfhzpa', 'clav6xpe0000108li3yow6pid'),
  ('clatwufkw0000ud8go3qfhzpa', 'clav74sgg000008mj2fkn3vi4'),
  ('clatwufkw0000ud8go3qfhzpa', 'clav79zat000108mj2306h1nz'),
  ('clatwufkw0000ud8go3qfhzpa', 'clav7fd0y000208mjfi8f1qmv'),
  ('clatwufkw0000ud8go3qfhzpa', 'clav928hi000008mm9kl837fa'),
  ('clatwufkw0000ud8go3qfhzpa', 'clav97m8v000008mfd4mxgbz0'),
  ('clav79zat000108mj2306h1nz', 'clav6vmeu000008li5mh2g748'),
  ('clav79zat000108mj2306h1nz', 'clavqcg4o000008jzh2xp7elz'),
  ('clav79zat000108mj2306h1nz', 'clavqcn92000108jz1grphjx2'),
  ('clav928hi000008mm9kl837fa', 'clavqcg4o000008jzh2xp7elz'),
  ('clav928hi000008mm9kl837fa', 'clavqcn92000108jz1grphjx2'),
  ('clav97m8v000008mfd4mxgbz0', 'clavqcn92000108jz1grphjx2');

-- CreateView
CREATE VIEW "UserFollows" AS
  SELECT f."followerId", u.*
  FROM "Followed" f
  INNER JOIN "user" u ON u."id" = f."followedId";

-- CreateView
CREATE VIEW "UserFollowedBy" AS
  SELECT f."followedId", u.*
  FROM "Followed" f
  INNER JOIN "user" u ON u."id" = f."followerId";

-- CreateView
CREATE VIEW "WhoToFollow" AS
  SELECT suggestions."userId", u.*
  FROM (
    SELECT
      userFollows."followerId" as "userId",
      userFollowsFollows."followedId" as "suggestionId",
      COUNT(*) as "followedByFollowsCount"
    FROM "Followed" userFollows
    INNER JOIN "Followed" userFollowsFollows ON
      userFollowsFollows."followerId" = userFollows."followedId"
    WHERE
      NOT EXISTS (
        SELECT *
        FROM "Followed" f
        WHERE
          f."followerId" = userFollows."followerId" AND
          f."followedId" = userFollowsFollows."followedId"
      )
    GROUP BY userFollows."followerId", userFollowsFollows."followedId"
  ) suggestions
  INNER JOIN "user" u ON u."id" = suggestions."suggestionId"
  ORDER BY suggestions."followedByFollowsCount" DESC
  LIMIT 2;

-- CreateTrigger
CREATE FUNCTION count_likes_on_tooeat_liked()
RETURNS TRIGGER AS $$
BEGIN

  UPDATE "Tooeat"
  SET "likes" = (SELECT COUNT(*) FROM "Liked" WHERE "tooeatId" = new."tooeatId")
  WHERE "id" = new."tooeatId";
  RETURN new;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER "CountLikesOnTooeatLiked" AFTER INSERT ON "Liked"
FOR EACH ROW
EXECUTE PROCEDURE count_likes_on_tooeat_liked();

-- CreateTrigger
CREATE FUNCTION count_likes_on_tooeat_unliked()
RETURNS TRIGGER AS $$
BEGIN

  UPDATE "Tooeat"
  SET "likes" = (SELECT COUNT(*) FROM "Liked" WHERE "tooeatId" = old."tooeatId")
  WHERE "id" = old."tooeatId";
  RETURN old;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER "CountLikesOnTooeatUnliked" AFTER DELETE ON "Liked"
FOR EACH ROW
EXECUTE PROCEDURE count_likes_on_tooeat_unliked();
