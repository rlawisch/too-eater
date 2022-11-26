-- Tests the database check to not let Too-eats over 280 characters long
insert into "Tooeat"
  ("url", "posted", "content", "likes", "userId")
values 
  ('9238572935abd', '2022-11-25T19:30:00.000Z', 'This is the way of testing the database check we have on very long Too-eats creation (one with a character length of more than 280). Trying to run this statement should trigger the database check, thus failing the insertion. It works because during "Tooeat" table creation we specified the "content" column as type TEXT NOT NULL CHECK (char_length(content) <= 280), which should do the trick.', 0, 'clatwufkw0000ud8go3qfhzpa');

-- Tests the (currently unused) Who To Follow view
select * from "WhoToFollow";