-- SCRIPTS A EJECUTARSE FUNDEMPRESA
-- TABLA ROL
INSERT INTO rol (id_rol,nombre,descripcion,peso,_usuario_creacion,_fecha_creacion,_fecha_modificacion) VALUES (3,'FUNDEMPRESA', 'Fundempresa',0,1,NOW(),NOW());
-- TABLA USUARIO
INSERT INTO usuario (email,usuario,contrasena,_usuario_creacion,_fecha_creacion,_fecha_modificacion,fid_persona) VALUES ('fundempresa', 'fundempresa', '25f9e794323b453885f5181f1b624d0b',1,NOW(),NOW(),1);
-- TABLA USUARIO ROL
INSERT INTO usuario_rol (_usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion, fid_rol, fid_usuario) VALUES (1, 1, NOW(), NOW(), 3, 3);
-- TABLA ROL_MENU
INSERT INTO rol_menu (method_get, method_post, method_put, method_delete, _usuario_creacion, _fecha_creacion, _fecha_modificacion, fid_menu, fid_rol) VALUES (TRUE, TRUE, TRUE, FALSE, 1, NOW(), NOW(), 7,3);
INSERT INTO rol_menu (method_get, method_post, method_put, method_delete, _usuario_creacion, _fecha_creacion, _fecha_modificacion, fid_menu, fid_rol) VALUES (TRUE, TRUE, TRUE, FALSE, 1, NOW(), NOW(), 13,3);
INSERT INTO rol_menu (method_get, method_post, method_put, method_delete, _usuario_creacion, _fecha_creacion, _fecha_modificacion, fid_menu, fid_rol) VALUES (TRUE, TRUE, TRUE, FALSE, 1, NOW(), NOW(), 15,3);

-- USUARIO MINISTERIO

DELETE FROM rol_menu WHERE id_rol_menu = 2;
INSERT INTO rol_menu (method_get, method_post, method_put, method_delete, _usuario_creacion, _fecha_creacion, _fecha_modificacion, fid_menu, fid_rol) VALUES (TRUE, TRUE, TRUE, FALSE, 1, NOW(), NOW(), 7,2);
INSERT INTO rol_menu (method_get, method_post, method_put, method_delete, _usuario_creacion, _fecha_creacion, _fecha_modificacion, fid_menu, fid_rol) VALUES (TRUE, TRUE, TRUE, FALSE, 1, NOW(), NOW(), 11,2);
INSERT INTO rol_menu (method_get, method_post, method_put, method_delete, _usuario_creacion, _fecha_creacion, _fecha_modificacion, fid_menu, fid_rol) VALUES (TRUE, TRUE, TRUE, FALSE, 1, NOW(), NOW(), 14,2);
INSERT INTO rol_menu (method_get, method_post, method_put, method_delete, _usuario_creacion, _fecha_creacion, _fecha_modificacion, fid_menu, fid_rol) VALUES (TRUE, TRUE, TRUE, FALSE, 1, NOW(), NOW(), 15,2);


ALTER TABLE solicitud DROP CONSTRAINT "solicitud_fid_ciiu_fkey";
