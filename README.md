# 🏎️ Formula 1 (F1) Racing DBMS Project

This project is a **relational database management system (DBMS)** designed to simulate and manage data operations in a Formula 1 (F1) racing environment. It integrates entities such as racers, teams, cars, races, coaches, pit stops, sponsors, and championships using normalized SQL tables and relationships.

---

## 📌 Problem Statement

F1 racing teams often face difficulty managing and utilizing data spread across multiple systems — from racer and vehicle stats to pit stop timings and sponsorship contracts.

This project aims to:
- Centralize all data into a structured, normalized database
- Enable real-time processing and advanced querying
- Improve team strategy, performance optimization, and sponsorship engagement

---

## 🧱 Database Design

### ✅ Core Entities
| Entity        | Description |
|---------------|-------------|
| `Racer`       | Racer details, nationality, team, car, and championship |
| `Team`        | Team details, owners, number of drivers |
| `Coach`       | Coach info, expertise, team affiliation |
| `Car`         | Car specs: chassis, engine, wheels, body, performance |
| `Pit_Stop`    | Timing data for tire change, fueling, repairs, racer change |
| `Race`        | Race date, location, weather, winners, related circuit and championship |
| `Circuit`     | Location, temperature, layout, and construction details |
| `Sponsor`     | Sponsorship contract, team, amount, terms |
| `Championship`| Season details, winners, participating teams |
| `Technical_Staff` | Engineers and mechanics per team |
| `Family`      | Racer’s family contacts |
| `Parts`       | Car component classifications: engine, body, wheels |

### 🔁 Relationship Tables
- `Racer_Coach`: Many-to-many between racers and coaches
- `Champ_Team`: Championship and team relation
- `Circuit_Team`: Which teams race at which circuits
- `Laps`: Stores lap-by-lap performance per race

---

## 🔄 Normalization

The project is fully normalized up to:
- **1NF**: No multivalued attributes (e.g., `Family`, `Laps`)
- **2NF**: No partial dependency (every non-key fully depends on primary key)
- **3NF**: No transitive dependency (non-key attributes only depend on keys)

---

## 💻 SQL Implementation

- SQL files include table creation, foreign key constraints, sample data insertion, and queries.
- Tools used: Microsoft SQL Server, MySQL-compatible syntax
- Identity columns and constraints included to ensure referential integrity

---

## 📊 Reports and Queries

### 📄 Report 1: Performance Factors
**Query Insight**: Combines `Car`, `Coach`, and `Pit_Stop` to analyze how:
- Coach expertise
- Car specs
- Pit stop times  
impact team performance.

### 📄 Report 2: Sponsorship & Team Success
**Query Insight**: Combines `Sponsor`, `Team`, and `Championship` to evaluate:
- Team performance across seasons
- Sponsor investments and returns

---

## 🛠️ Tools & Technologies

- **SQL**: Schema design, normalization, data population
- **ERD Tool**: Used to build Entity-Relationship Diagrams
- **PowerPoint**: Presentation and documentation
- **Manual Data Entry**: Sample data for all 10+ entities

---


---

## 📎 Files Included

| File | Description |
|------|-------------|
| `Entities.sql` | Basic schema definitions |
| `Project_Phase_2.sql` | Implementation schema with sample data |
| `SQLQuery2_final_proj.sql` | Full version with all entities, relationships, and insertions |
| `New.sql` | Final insert-ready schema with identity columns |
| `Normalization Form.docx` | UNF to 3NF breakdown of all tables |
| `Yashwant_Tejeshwar_DBMS_Project.pptx` | PowerPoint project summary |
| `ERD_in_INK.jpeg` | Visual ER diagram |

---

## 🚀 Future Improvements

- Add user interface or dashboard for live interaction
- Implement triggers and stored procedures
- Support time-series queries on race and performance data
- Integrate live APIs from real F1 data sources

---

## 📫 Contact

For questions or collaboration:

**Yashwant Singh Katailiha**  
 

---
