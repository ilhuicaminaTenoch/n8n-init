CREATE TABLE citas (
  id              SERIAL PRIMARY KEY,
  nombre_cliente  TEXT NOT NULL,
  telefono        TEXT NOT NULL,
  email           TEXT,
  tipo_servicio   TEXT NOT NULL,
  direccion       TEXT,
  fecha_preferida DATE NOT NULL,
  hora_preferida  TEXT,
  notas           TEXT,
  estado          TEXT NOT NULL DEFAULT 'pendiente',
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE cotizaciones (
    id SERIAL PRIMARY KEY,
    cita_id INTEGER REFERENCES,
    citas(id) ON DELETE CASCADE,
    texto_completo TEXT NOT NULL,
    total_equipos DECIMAL(10,2) NOT NULL,
    estado VARCHAR(20) DEFAULT 'pendiente',
    created_at TIMESTAMP DEFAULT NOW(),
    UNIQUE(cita_id)
);

CREATE TABLE productos_cotizados (
    id SERIAL PRIMARY KEY,
    cotizacion_id INTEGER REFERENCES cotizaciones(id) ON DELETE CASCADE,
    nombre_producto VARCHAR(255) NOT NULL,
    cantidad INTEGER NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    notas TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);