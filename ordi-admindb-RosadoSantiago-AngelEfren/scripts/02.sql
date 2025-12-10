USE ordi-admindb-RosadoSantiago-AngelEfren;

INSERT INTO genres (name, created_by) VALUES
('Rock','seed'),
('Pop','seed'),
('Hip-Hop','seed'),
('Jazz','seed'),
('Indie','seed');

INSERT INTO artists (name, country, created_by) VALUES
('Band A','Mexico','seed'),
('Artist B','Colombia','seed'),
('Solo C','Argentina','seed'),
('Group D','Chile','seed'),
('Artist E','Peru','seed');

INSERT INTO albums (artist_id, title, release_date, genre_id, created_by) VALUES
(1,'Album A1','2023-01-01',1,'seed'),
(2,'Album B1','2024-03-10',2,'seed'),
(3,'Album C1','2022-07-07',3,'seed'),
(1,'Album A2','2025-05-05',1,'seed'),
(4,'Album D1','2021-11-11',4,'seed');

INSERT INTO songs (album_id, artist_id, title, duration_seconds, created_by) VALUES
(1,1,'Song A1',210,'seed'),
(1,1,'Song A2',180,'seed'),
(2,2,'Song B1',240,'seed'),
(3,3,'Song C1',200,'seed'),
(4,1,'Song A3',320,'seed');

INSERT INTO users (email, name, country, birth_date, created_by) VALUES
('u1@example.com','User One','Mexico','1990-01-01','seed'),
('u2@example.com','User Two','Colombia','1995-02-02','seed'),
('u3@example.com','User Three','Argentina','1992-03-03','seed'),
('u4@example.com','User Four','Chile','1988-04-04','seed'),
('u5@example.com','User Five','Peru','2000-05-05','seed');

INSERT INTO playlists (user_id, name, created_by) VALUES
(1,'Mi Playlist 1','seed'),
(1,'Mi Playlist 2','seed'),
(2,'Road Trip','seed'),
(3,'Favorites','seed'),
(4,'Chill','seed');

INSERT INTO playlist_tracks (playlist_id, song_id, track_order, created_by) VALUES
(1,1,1,'seed'),
(1,2,2,'seed'),
(2,3,1,'seed'),
(3,4,1,'seed'),
(4,5,1,'seed');

INSERT INTO listens (user_id, song_id, listened_at, duration_listened_seconds, created_by) VALUES
(1,1,'2025-01-05 10:00:00',210,'seed'),
(1,2,'2025-02-06 12:10:00',180,'seed'),
(2,3,'2025-03-07 20:20:00',240,'seed'),
(3,1,'2025-04-08 09:00:00',50,'seed'),
(4,5,'2025-05-09 15:00:00',320,'seed');

INSERT INTO subscriptions (user_id, plan, start_date, end_date, price, created_by) VALUES
(1,'premium','2025-01-01','2026-01-01',9.99,'seed'),
(2,'free','2024-01-01','2024-12-31',0.00,'seed'),
(3,'familiar','2025-03-01','2026-03-01',19.99,'seed'),
(4,'estudiantil','2025-02-01','2025-08-01',4.99,'seed'),
(5,'premium','2025-06-01','2026-06-01',9.99,'seed');