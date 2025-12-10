USE ordi-admindb-RosadoSantiago-AngelEfren;
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS genres (
  genre_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME DEFAULT NULL,
  updated_by VARCHAR(100),
  active BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS artists (
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  country VARCHAR(100),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME DEFAULT NULL,
  updated_by VARCHAR(100),
  active BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS albums (
  album_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  release_date DATE,
  cover_url VARCHAR(500),
  genre_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME DEFAULT NULL,
  updated_by VARCHAR(100),
  active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE IF NOT EXISTS songs (
  song_id INT AUTO_INCREMENT PRIMARY KEY,
  album_id INT,
  artist_id INT,
  title VARCHAR(255) NOT NULL,
  duration_seconds INT NOT NULL,
  is_public BOOLEAN DEFAULT TRUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME DEFAULT NULL,
  updated_by VARCHAR(100),
  active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (album_id) REFERENCES albums(album_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE IF NOT EXISTS users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255),
  country VARCHAR(100),
  birth_date DATE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME DEFAULT NULL,
  updated_by VARCHAR(100),
  active BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS playlists (
  playlist_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  name VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME DEFAULT NULL,
  updated_by VARCHAR(100),
  active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS playlist_tracks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  playlist_id INT NOT NULL,
  song_id INT NOT NULL,
  track_order INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME DEFAULT NULL,
  updated_by VARCHAR(100),
  active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE IF NOT EXISTS listens (
  listen_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  song_id INT,
  listened_at DATETIME,
  duration_listened_seconds INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME DEFAULT NULL,
  updated_by VARCHAR(100),
  active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE IF NOT EXISTS subscriptions (
  subscription_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  plan VARCHAR(100),
  start_date DATE,
  end_date DATE,
  price DECIMAL(10,2),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by VARCHAR(100),
  updated_at DATETIME DEFAULT NULL,
  updated_by VARCHAR(100),
  active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

SET FOREIGN_KEY_CHECKS=1;