select * from public.users

{{ config(
    post_hook=[
      "ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);"
    ]
) }}