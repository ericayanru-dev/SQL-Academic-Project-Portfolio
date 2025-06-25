## Art Gallery Database Schema

This SQL script creates a normalized database schema to store information about:

- Artists and their biographical details
- Titles of artworks
- Keywords associated with artworks
- Many-to-many relationship between keywords and artworks

### Tables

- **artist** – stores names, dates, country, and location
- **title** – stores title, year, period, type, and foreign key to artist
- **keyword** – stores searchable keywords
- **keyword_has_title** – junction table linking keywords and titles

### Foreign Keys & Relationships

- `title.artist_id` → `artist.artist_id` (One-to-Many)
- `keyword_has_title.keyword_id` → `keyword.keyword_id`
- `keyword_has_title.title_id` → `title.title_id` (Many-to-Many)

### How to Run

```sql
-- Run this script in MySQL Workbench
SOURCE art_schema.sql;
