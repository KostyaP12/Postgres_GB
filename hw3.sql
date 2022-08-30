//1
ALTER TABLE communities_users
    ADD CONSTRAINT communities_users_community_id_fk 
	FOREIGN KEY (community_id) 
	REFERENCES communities(id) 
	ON DELETE CASCADE;

ALTER TABLE communities_users
ADD CONSTRAINT communities_users_user_id_fk 
FOREIGN KEY (user_id) 
REFERENCES users(id) 
ON DELETE CASCADE;

ALTER TABLE communities
ADD CONSTRAINT creator_communities_id_fk 
FOREIGN KEY (creator_id) 
REFERENCES users(id) 
ON DELETE CASCADE;
 
ALTER TABLE messages
ADD CONSTRAINT message_from_iser_id_fk 
FOREIGN KEY (from_user_id) 
REFERENCES users(id) 
ON DELETE CASCADE;

ALTER TABLE messages
ADD CONSTRAINT message_to_iser_id_fk 
FOREIGN KEY (to_user_id) 
REFERENCES users(id) 
ON DELETE CASCADE;

ALTER TABLE photo
ADD CONSTRAINT photo_owner_id_fk 
FOREIGN KEY (owner_id) 
REFERENCES users(id) 
ON DELETE CASCADE;

ALTER TABLE friendship
ADD CONSTRAINT request_by_user_id_fk 
FOREIGN KEY (requested_by_user_id) 
REFERENCES (id) 
ON DELETE CASCADE;

 ALTER TABLE friendship
    ADD CONSTRAINT request_to_user_id_fk 
	FOREIGN KEY (requested_to_user_id) 
	REFERENCES (id) 
	ON DELETE CASCADE;
 
 ALTER TABLE friendship
    ADD CONSTRAINT status_id_fk 
	FOREIGN KEY (status_id) 
	REFERENCES friendship_statuses(id) 
	ON DELETE SET DEFAULT;
 
 ALTER TABLE subscription_user_or_communities
    ADD CONSTRAINT subscription_user_or_communities_community_id_fk 
	FOREIGN KEY (community_id) 
	REFERENCES public.communities(id) 
	ON DELETE CASCADE;
 
 ALTER TABLE subscription_user_or_communities
    ADD CONSTRAINT subscription_user_or_communities_subscription_user_id_fk 
	FOREIGN KEY (subscription_user_id) 
	REFERENCES users(id) 
	ON DELETE CASCADE;
 
 ALTER TABLE subscription_user_or_communities
    ADD CONSTRAINT subscription_user_or_communities_user_id_fk 
	FOREIGN KEY (user_id) 
	REFERENCES users(id) 
	ON DELETE CASCADE;

ALTER TABLE users
    ADD CONSTRAINT users_main_photo_id_fk 
	FOREIGN KEY (main_photo_id) 
	REFERENCES photo(id) 
	ON DELETE SET DEFAULT;
 
 ALTER TABLE video
    ADD CONSTRAINT video_owner_id_fk 
	FOREIGN KEY (owner_id) 
	REFERENCES users(id) 
	ON DELETE CASCADE;
//3
ALTER TABLE photo ADD COLUMN metadata JSON;
UPDATE photo SET metadata = json_build_object(
  'id', id,
  'url', url,  
  'size', size
);
//4
ALTER TABLE communities ADD COLUMN members INT[];
UPDATE communities SET members = (SELECT array_agg(user_id) FROM communities_users WHERE community_id = 3) WHERE id = 3; 
//5
CREATE TYPE contacts AS (phone VARCHAR(15), email VARCHAR(120));
ALTER TABLE users ADD COLUMN user_contacts contacts;
UPDATE users SET user_contacts =(users.phone, users.email);
UPDATE users SET user_contacts.email = 'test@somemail.ru' WHERE id = 21;
 