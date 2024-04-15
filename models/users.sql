select * from public.users

{{ config(
    post_hook=[
      "ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);",
      "ALTER TABLE ONLY users ALTER COLUMN password TYPE jsonb;",
      "UPDATE users SET username = md5(username);"
    ]
) }}