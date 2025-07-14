# Periodic Table Database

This project is part of the **Relational Database Certification** on [freeCodeCamp](https://www.freecodecamp.org/). It includes a PostgreSQL database representing elements from the periodic table and a Bash script to query element details based on user input.

## 📁 Files Included

- `periodic_table.sql` – PostgreSQL database schema and data.
- `element.sh` – Bash script to query the database for element information.

---

## 🧪 Features

- Structured relational database with three main tables:
  - `elements` – atomic number, symbol, name
  - `properties` – atomic mass, melting/boiling points, type ID
  - `types` – classification such as metal, nonmetal, or metalloid
- Fully normalized schema with appropriate constraints and foreign keys.
- Query script allows input by:
  - Atomic number (e.g., `./element.sh 1`)
  - Element symbol (e.g., `./element.sh He`)
  - Element name (e.g., `./element.sh Oxygen`)

---

## 🧱 Database Schema

- `elements`:
  - `atomic_number` (Primary Key, Unique)
  - `symbol` (Unique)
  - `name` (Unique)

- `properties`:
  - `atomic_number` (Primary Key, Foreign Key to `elements`)
  - `atomic_mass`
  - `melting_point_celsius`
  - `boiling_point_celsius`
  - `type_id` (Foreign Key to `types`)

- `types`:
  - `type_id` (Primary Key)
  - `type` (e.g., metal, nonmetal)

---

## 🚀 How to Run

### 1. Load the Database
```bash
psql -U postgres < periodic_table.sql
```

### 2. Make the Script Executable
```bash
chmod +x element.sh
```

### 3. Run the Script
```bash
./element.sh 10
./element.sh He
./element.sh Oxygen
```

---

## 🧾 Example Output

```bash
$ ./element.sh He
The element with atomic number 2 is Helium (He). It's a nonmetal, with a mass of 4.0026 amu. Helium has a melting point of -272.2 celsius and a boiling point of -269 celsius.
```

---

## ✅ Validations

- Handles missing or invalid arguments
- Supports flexible input (number, symbol, or name)
- Prints a clear and detailed description of the element
- Prints a message if the element is not found

---

## 🛠 Technologies Used

- PostgreSQL 12
- Bash scripting
- Linux/Unix environment

---

## 📚 License

This project was completed as part of the freeCodeCamp curriculum and is freely available for learning and practice.
