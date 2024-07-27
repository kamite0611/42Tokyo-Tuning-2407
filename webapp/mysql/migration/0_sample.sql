-- このファイルに記述されたSQLコマンドが、マイグレーション時に実行されます。
ALTER TABLE areas ADD INDEX idx(id);

ALTER TABLE dispatchers ADD INDEX idx(id);
ALTER TABLE dispatchers ADD INDEX idx_userId(user_id);
ALTER TABLE dispatchers ADD INDEX idx_areaId(area_id);


ALTER TABLE edges ADD INDEX idx(id);
ALTER TABLE edges ADD INDEX idx_node_a_id(node_a_id);
ALTER TABLE edges ADD INDEX idx_node_b_id(node_b_id);


ALTER TABLE locations ADD INDEX idx(id);
ALTER TABLE locations ADD INDEX idx_tow_truck_id(tow_truck_id);
ALTER TABLE locations ADD INDEX idx_node_id(node_id);


ALTER TABLE nodes ADD INDEX idx(id);
ALTER TABLE nodes ADD INDEX idx_area_id(area_id);


ALTER TABLE orders ADD INDEX idx(id);
ALTER TABLE orders ADD INDEX idx_client_id(client_id);
ALTER TABLE orders ADD INDEX idx_dispatcher_id(dispatcher_id);
ALTER TABLE orders ADD INDEX idx_tow_truck_id(tow_truck_id);
ALTER TABLE orders ADD INDEX idx_node_id(node_id);


ALTER TABLE tow_trucks ADD INDEX idx(id);
ALTER TABLE tow_trucks ADD INDEX idx_driver_id(driver_id);
ALTER TABLE tow_trucks ADD INDEX idx_area_id(area_id);


ALTER TABLE users ADD INDEX idx(id);


ALTER TABLE sessions ADD INDEX idx(id);


