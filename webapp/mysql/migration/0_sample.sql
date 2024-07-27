-- このファイルに記述されたSQLコマンドが、マイグレーション時に実行されます。
ALTER TABLE areas ADD INDEX areas_id(id);

ALTER TABLE dispatchers ADD INDEX dispatcher_id(id);
ALTER TABLE dispatchers ADD INDEX dispatcher_id_userId(user_id);
ALTER TABLE dispatchers ADD INDEX dispatcher_id_areaId(area_id);


ALTER TABLE edges ADD INDEX edges_id(id);
ALTER TABLE edges ADD INDEX edges_id_node_a_id(node_a_id);
ALTER TABLE edges ADD INDEX edges_id_node_b_id(node_b_id);


ALTER TABLE locations ADD INDEX locations_id(id);
ALTER TABLE locations ADD INDEX locations_id_tow_truck_id(tow_truck_id);
ALTER TABLE locations ADD INDEX locations_id_node_id(node_id);


ALTER TABLE nodes ADD INDEX nodes_id(id);
ALTER TABLE nodes ADD INDEX nodes_id_area_id(area_id);


ALTER TABLE orders ADD INDEX orders_id(id);
ALTER TABLE orders ADD INDEX orders_id_client_id(client_id);
ALTER TABLE orders ADD INDEX orders_id_dispatcher_id(dispatcher_id);
ALTER TABLE orders ADD INDEX orders_id_tow_truck_id(tow_truck_id);
ALTER TABLE orders ADD INDEX orders_id_node_id(node_id);


ALTER TABLE tow_trucks ADD INDEX tow_truck_id(id);
ALTER TABLE tow_trucks ADD INDEX tow_truck_id_driver_id(driver_id);
ALTER TABLE tow_trucks ADD INDEX tow_truck_id_area_id(area_id);


ALTER TABLE users ADD INDEX users_id(id);


ALTER TABLE sessions ADD INDEX sessions_id(id);


