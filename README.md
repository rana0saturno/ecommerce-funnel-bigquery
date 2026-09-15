# 🛒 Análisis de Embudo de Conversión - E-commerce

Análisis del comportamiento de usuarios en un e-commerce para identificar
dónde se pierden clientes en el proceso de compra y qué canales de tráfico
generan más ventas.

## 🎯 Objetivo

- Medir las tasas de conversión en cada etapa del proceso de compra.
- Identificar en qué punto se pierden más clientes.
- Comparar el rendimiento de cada canal de tráfico.
- Calcular métricas clave de ingresos para evaluar rentabilidad.

## 🛠️ Herramientas utilizadas

- **SQL (BigQuery)** – extracción y transformación de datos
- **Looker Studio** – visualización de resultados
- **GitHub** – documentación y versionado

## 📊 Dataset

Tabla de eventos de usuario con más de 9.000 registros que incluyen
visitas a páginas, agregados al carrito, inicios de checkout, pagos
y compras, junto con el canal de tráfico de origen.

Período analizado: últimos 30 días disponibles en el dataset.

## 🔍 Análisis realizados

1. **Embudo general** – tasas de conversión en cada etapa del proceso de compra
2. **Embudo por canal** – comparación de rendimiento entre canales de tráfico
3. **Recorrido del usuario** – tiempos promedio entre etapas
4. **Métricas de ingresos** – ticket promedio, ingreso por visitante y por comprador

## 💡 Hallazgos clave

- ✅ **El proceso de pago funciona de forma óptima**: más del 80% de
  conversión entre inicio de checkout y compra final.
- ⚠️ **Las redes sociales generan volumen, pero no ventas**: ~30% del
  tráfico pero la conversión más baja (~6%).
- 📧 **El email es el canal más rentable**: ~13% de conversión, más del
  doble que redes sociales.
- 💰 **Existe un techo de rentabilidad claro**: ticket promedio de ~$115,
  lo que limita el costo de adquisición a un máximo de $30-$40.

## 🚀 Recomendaciones

1. No modificar el proceso de checkout (ya funciona bien).
2. Reasignar presupuesto de redes sociales hacia retargeting y captura de emails.
3. Implementar una estrategia agresiva de captura de emails.
4. Auditar el gasto publicitario en función del ticket promedio (AOV).

## 📁 Estructura del repositorio

## 🔗 Enlaces

- 📊 [Ver análisis completo en Notion] [-------](https://app.notion.com/p/Portafolio-An-lisis-de-Embudo-de-Conversi-n-E-commerce-3db0649d3e8f8044a391e72774d0bd09?source=copy_link)
- 📈 [Ver dashboard interactivo en Looker Studio]. ----------
- 💼 [Mi perfil de LinkedIn]. ------------------
