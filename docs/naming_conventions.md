# Naming Conventions

## General Guidelines

- **Language**: Use English for all identifiers.
- **Case Format**: Use `snake_case` — all lowercase with underscores (`_`) separating words.
- **Avoid Reserved Words**: Do **not** use SQL reserved keywords for naming tables, columns, or procedures.

---

## Table Naming Conventions

### Bronze & Silver Layers

- **Format**: `<source_system>_<entity>`
- **Rule**: Every table name must start with the **source system** name, followed by the **entity name** (e.g., `crm_customer`, `erp_sales`).

###  Gold Layer

- **Format**: `<category>_<entity>`
- **Rule**: Use a **category prefix** representing the data modeling type, followed by the entity name.
- **Allowed Categories**:
  - `fact` – for fact tables (e.g., `fact_sales`)
  - `dim` – for dimension tables (e.g., `dim_customer`)
  - `agg` – for aggregated data (e.g., `agg_monthly_revenue`)

> **Note**: Gold layer tables do **not** reference source systems in their names.

---

##  Key Naming Convention

- **Surrogate keys** must end with `_key`.
- **Format**: `<table_name>_key`
- **Example**: `customer_key`, `sales_order_key`

---

## Stored Procedure Naming

- **Format**: `load_<layer>`
- **Rule**: Stored procedures must begin with the keyword `load_`, followed by the name of the **data layer** they target.
- **Examples**:
  - `load_bronze` → Procedure for loading the bronze layer.
  - `load_silver` → Procedure for loading the silver layer.

---

By following these naming conventions, your data warehouse will remain clean, consistent, and easy to scale or collaborate on across teams.
