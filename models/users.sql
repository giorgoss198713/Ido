select * from public.users

{{ config(
    post_hook=[
      "ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);",
      "ALTER TABLE ONLY users ADD CONSTRAINT unique_id UNIQUE (id);",
      "ALTER TABLE ONLY users ADD PRIMARY KEY (id);",
      "ALTER TABLE ONLY users ALTER COLUMN id SET NOT NULL",
      "ALTER TABLE ONLY users ALTER COLUMN password TYPE jsonb USING password::jsonb;",
      "ALTER TABLE ONLY users ALTER COLUMN password SET NOT NULL",
      "UPDATE users SET username = md5(username);",
      "ALTER TABLE ONLY users ALTER COLUMN username SET NOT NULL;",
      "ALTER TABLE ONLY users ALTER COLUMN type SET NOT NULL;",
      "ALTER TABLE ONLY users ALTER COLUMN require_new_password SET DEFAULT false;",
      "ALTER TABLE ONLY users ALTER COLUMN require_otp SET DEFAULT false;",
      "ALTER TABLE ONLY users ALTER COLUMN active SET DEFAULT true;",
      "ALTER TABLE ONLY users ALTER COLUMN settings TYPE jsonb USING settings::jsonb;",
      "ALTER TABLE ONLY users ALTER COLUMN sessions TYPE jsonb USING sessions::jsonb;",
      "ALTER TABLE ONLY users ALTER COLUMN change_log TYPE jsonb USING change_log::jsonb;",
      "ALTER TABLE ONLY users ALTER COLUMN overridden_permissions TYPE jsonb USING overridden_permissions::jsonb;",
      "ALTER TABLE ONLY users ALTER COLUMN permissions TYPE jsonb USING permissions::jsonb;",
      "ALTER TABLE ONLY users ALTER COLUMN last_login_ip TYPE inet;",
      "ALTER TABLE ONLY users ALTER COLUMN id TYPE INT;",
      "ALTER TABLE ONLY users ALTER COLUMN type TYPE INT;"
    ]
) }}