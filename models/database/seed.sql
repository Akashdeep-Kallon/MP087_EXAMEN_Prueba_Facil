-- ============================================================
-- DojoSearch Database Script
-- Database: mp0487_dojosearch
-- ============================================================

CREATE DATABASE IF NOT EXISTS mp0487_dojosearch
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE mp0487_dojosearch;

-- ============================================================
-- TABLE: users
-- ============================================================
CREATE TABLE IF NOT EXISTS users (
    id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    name             VARCHAR(100)    NOT NULL,
    username         VARCHAR(50)     NOT NULL UNIQUE,
    email            VARCHAR(150)    NOT NULL UNIQUE,
    fecha_born       DATE            NOT NULL,
    password         VARCHAR(255)    NOT NULL,
    is_admin         TINYINT(1)      NOT NULL DEFAULT 0,
    photo            LONGBLOB        NULL,
    bio              TEXT            NULL,
    phone            VARCHAR(20)     NULL,
    twitter          VARCHAR(100)    NULL,
    instagram        VARCHAR(100)    NULL,
    facebook         VARCHAR(100)    NULL,
    youtube          VARCHAR(100)    NULL,
    email_messages   TINYINT(1)      NOT NULL DEFAULT 1,
    email_reminders  TINYINT(1)      NOT NULL DEFAULT 1,
    email_promotions TINYINT(1)      NOT NULL DEFAULT 0,
    created_at       DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- TABLE: events
-- ============================================================
CREATE TABLE IF NOT EXISTS events (
    id          INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    name        VARCHAR(150)    NOT NULL,
    description TEXT            NULL,
    date        DATETIME        NOT NULL,
    location    VARCHAR(200)    NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- SEED DATA: users
-- Plain-text password for ALL users: password
-- ============================================================
INSERT INTO users (name, username, email, fecha_born, password, is_admin, bio, phone, twitter, instagram, facebook, youtube, email_messages, email_reminders, email_promotions, created_at) VALUES
('Carlos Mendoza',    'cmendoza',    'carlos.mendoza@dojo.com',    '1990-03-15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'Instructor de karate con 15 años de experiencia.',   '+34 600 111 001', '@cmendoza',    '@cmendoza_dojo',    'fb.com/cmendoza',    'youtube.com/cmendoza',    1, 1, 1, '2025-01-10 09:00:00'),
('Laura Sánchez',     'lsanchez',    'laura.sanchez@dojo.com',     '1995-07-22', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'Cinturón negro 3er dan en judo.',                    '+34 600 111 002', '@lsanchez',    '@lsanchez_judo',    'fb.com/lsanchez',    'youtube.com/lsanchez',    1, 1, 0, '2025-01-15 10:30:00'),
('Miguel Torres',     'mtorres',     'miguel.torres@dojo.com',     '1988-11-05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'Practicante de artes marciales mixtas.',             '+34 600 111 003', '@mtorres',     '@mtorres_mma',      'fb.com/mtorres',     NULL,                      1, 0, 1, '2025-02-01 08:00:00'),
('Ana García',        'agarcia',     'ana.garcia@dojo.com',        '1993-04-18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'Entusiasta del taekwondo desde los 12 años.',        '+34 600 111 004', '@agarcia',     '@agarcia_tkd',      NULL,                 NULL,                      1, 1, 0, '2025-02-10 11:00:00'),
('Pedro Ruiz',        'pruiz',       'pedro.ruiz@dojo.com',        '1985-09-30', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'Competidor nacional de boxeo tailandés.',            '+34 600 111 005', '@pruiz',       '@pruiz_muaythai',   'fb.com/pruiz',       'youtube.com/pruiz',       0, 1, 1, '2025-02-20 14:00:00'),
('Sofía López',       'slopez',      'sofia.lopez@dojo.com',       '1998-12-01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'Aprendiz de aikido y meditación zen.',               '+34 600 111 006', '@slopez',      '@slopez_aikido',    NULL,                 NULL,                      1, 1, 0, '2025-03-01 09:30:00'),
('Daniel Fernández',  'dfernandez',  'daniel.fernandez@dojo.com',  '1992-06-14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'Estudiante de wing chun y kung fu shaolin.',         '+34 600 111 007', '@dfernandez',  '@dfernandez_wc',    'fb.com/dfernandez',  NULL,                      0, 0, 0, '2025-03-15 16:00:00'),
('Elena Martínez',    'emartinez',   'elena.martinez@dojo.com',    '1996-02-28', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'Instructora junior de capoeira.',                    '+34 600 111 008', '@emartinez',   '@emartinez_cap',    'fb.com/emartinez',   'youtube.com/emartinez',   1, 1, 1, '2025-04-01 10:00:00'),
('Javier Moreno',     'jmoreno',     'javier.moreno@dojo.com',     '1987-08-09', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'Practicante avanzado de krav maga.',                 '+34 600 111 009', '@jmoreno',     '@jmoreno_kravmaga', NULL,                 NULL,                      1, 0, 0, '2025-04-10 13:00:00'),
('Isabel Romero',     'iromero',     'isabel.romero@dojo.com',     '2000-05-17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, 'Nueva estudiante interesada en karate y judo.',      '+34 600 111 010', '@iromero',     '@iromero_arts',     'fb.com/iromero',     NULL,                      1, 1, 1, '2025-05-01 08:45:00');

-- ============================================================
-- SEED DATA: events
-- ============================================================
INSERT INTO events (name, description, date, location) VALUES
('Torneo Regional de Karate',         'Competición regional abierta a todos los niveles. Categorías infantil, junior y senior.',                                   '2026-06-14 09:00:00', 'Pabellón Municipal de Deportes, Madrid'),
('Seminario de Judo Avanzado',        'Seminario impartido por el maestro Hiroshi Tanaka. Enfocado en técnicas de ne-waza y atemi.',                               '2026-06-28 10:00:00', 'Dojo Central, Barcelona'),
('Campeonato de Taekwondo WTF',       'Campeonato oficial con árbitros certificados. Se requiere licencia federativa vigente.',                                    '2026-07-05 08:30:00', 'Polideportivo Norte, Valencia'),
('Clase Abierta de Muay Thai',        'Sesión de entrenamiento gratuita para nuevos estudiantes. Material deportivo incluido.',                                    '2026-07-12 18:00:00', 'Gym Fighter Club, Sevilla'),
('Exhibición de Artes Marciales',     'Demostración de múltiples disciplinas: capoeira, aikido, kung fu y más. Entrada libre.',                                    '2026-07-19 17:00:00', 'Plaza Mayor, Zaragoza'),
('Workshop de Defensa Personal',      'Taller intensivo de 4 horas basado en técnicas de krav maga y jiu-jitsu brasileño.',                                        '2026-08-02 10:00:00', 'Centro Deportivo Olimpia, Bilbao'),
('Encuentro Nacional de Aikido',      'Reunión anual de practicantes de aikido de toda España. Incluye ponencias y práctica libre.',                               '2026-08-16 09:00:00', 'Auditorio Deportivo, Málaga'),
('Copa Infantil de Artes Marciales',  'Competición exclusiva para menores de 14 años. Disciplinas: karate, judo y taekwondo.',                                     '2026-09-06 10:00:00', 'Pabellón Escolar, Murcia'),
('Gala de Cinturones Negros',         'Ceremonia de graduación y exhibición de los alumnos que han alcanzado el cinturón negro en distintas artes marciales.',     '2026-09-20 19:00:00', 'Teatro Municipal, Alicante'),
('Campamento de Verano Marcial',      'Campamento residencial de 5 días con entrenamiento diario, meditación y convivencia. Plazas limitadas.',                   '2026-10-05 08:00:00', 'Complejo Rural El Pinar, Segovia');
