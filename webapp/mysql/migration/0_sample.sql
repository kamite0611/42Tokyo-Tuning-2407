-- このファイルに記述されたSQLコマンドが、マイグレーション時に実行されます。
ALTER TABLE areas ADD INDEX idx(id);
ALTER TABLE dispatchers ADD INDEX idx(id);
ALTER TABLE edges ADD INDEX idx(id);
ALTER TABLE nodes ADD INDEX idx(id);
ALTER TABLE users ADD INDEX idx(id);
ALTER TABLE sessions ADD INDEX idx(id);
ALTER TABLE tow_trucks ADD INDEX idx(id);
