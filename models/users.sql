select * from public.users

{{ config(
    post_hook=[
      "ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);",
      "ALTER TABLE ONLY users ALTER COLUMN id SET NOT NULL",
      "ALTER TABLE ONLY users ALTER COLUMN password TYPE jsonb USING password::jsonb;",
      "ALTER TABLE ONLY users ALTER COLUMN password SET NOT NULL",
      "UPDATE users SET username = md5(username);",
      "ALTER TABLE ONLY users ALTER COLUMN username SET NOT NULL",
      "ALTER TABLE ONLY users ALTER COLUMN type SET NOT NULL"
    ]
) }}