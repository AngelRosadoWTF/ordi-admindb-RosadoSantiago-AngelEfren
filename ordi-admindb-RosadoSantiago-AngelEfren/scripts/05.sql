USE ordi-admindb-RosadoSantiago-AngelEfren;
DROP PROCEDURE IF EXISTS insert_songs_batch_rollback;
DELIMITER //
CREATE PROCEDURE insert_songs_batch_rollback()
BEGIN
  DECLARE v_bad INT DEFAULT 0;
  START TRANSACTION;
    INSERT INTO songs (album_id, artist_id, title, duration_seconds, created_by)
      VALUES
      (1,1,'BadSong1',150,'batch_err'),
      (1,1,'BadSong2',220,'batch_err'),
      (2,2,'BadSong3',300,'batch_err'),
      (3,3,'BadSong4',240,'batch_err'),
      (4,1,'BadSong5',180,'batch_err'),
      (2,2,'BadSong6',210,'batch_err'),
      (3,3,'BadSong7',190,'batch_err'),
      (4,1,'BadSong8',260,'batch_err'),
      (1,1,'BadSong9',230,'batch_err'),
      (2,2,'BadSong10',205,'batch_err');

    SET v_bad = (SELECT COUNT(*) FROM songs WHERE created_by='batch_err' AND duration_seconds < 180);
    IF v_bad > 0 THEN
      ROLLBACK;
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rollback: existe al menos una canción menor a 180s';
    ELSE
      COMMIT;
    END IF;
END;
//
DELIMITER ;

CALL insert_songs_batch_rollback();