USE ordi-admindb-RosadoSantiago-AngelEfren;
DROP PROCEDURE IF EXISTS insert_songs_batch;
DELIMITER //
CREATE PROCEDURE insert_songs_batch()
BEGIN
  DECLARE v_bad INT DEFAULT 0;
  START TRANSACTION;
    INSERT INTO songs (album_id, artist_id, title, duration_seconds, created_by)
      VALUES
      (1,1,'BatchSong1',200,'batch'),
      (1,1,'BatchSong2',220,'batch'),
      (2,2,'BatchSong3',300,'batch'),
      (3,3,'BatchSong4',240,'batch'),
      (4,1,'BatchSong5',180,'batch'),
      (2,2,'BatchSong6',210,'batch'),
      (3,3,'BatchSong7',190,'batch'),
      (4,1,'BatchSong8',260,'batch'),
      (1,1,'BatchSong9',230,'batch'),
      (2,2,'BatchSong10',205,'batch');

    SET v_bad = (SELECT COUNT(*) FROM songs WHERE created_by='batch' AND duration_seconds < 180);
    IF v_bad > 0 THEN
      ROLLBACK;
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rollback: existe al menos una canción menor a 180s';
    ELSE
      COMMIT;
    END IF;
END;
//
DELIMITER ;

CALL insert_songs_batch();