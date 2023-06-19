Показать и обьяснить как работает модель dbt increment
на общем частом примере - обновление таблицы-приемника 
на основании данных двух таблиц источников.
 
Для примера:
приемник:
  - таблица postgres  dst_table
источники:
  - таблицы postgres src_table1
  - таблицы postgres src_table2
 
Таблицы имеют следующую структуру:
 
dst_table
 CREATE UNLOGGED TABLE public.dst_table (
  id varchar(20) NULL,
  id_fkey varchar(20) NULL,
  somedata varchar(15) NULL,
  regdate date NULL);
 
src_table1 аналогична dst_table (для упрощения примера)
 CREATE UNLOGGED TABLE public.src_table1 (
  id varchar(20) NULL,
  id_fkey varchar(20) NULL,
  somedata varchar(15) NULL,
  regdate date NULL);
 
 
  CREATE UNLOGGED TABLE src_table2 (
   id varchar(20) NULL,
  id_fkey varchar(20) NULL,
  reg_date date NULL);
 
 Для примера нужна модель, которая обновляет
таблицу приемник (dst_table) данными из src_table2 на основаниии
ключа уникальности id_fkey varchar(20)
то есть , если нет ключа, то добавляем запись из src_table1, если  есть - обновлем запись из из src_table1, НО
дату regdate берем из таблицы источника src_table2 (reg_date).
 
Для таблицы dst_table должна выполняться операция TRANSFORM
заменной даты.
 
Обычный sql запрос выглдит так:
 
update dst_table dt
set dt.ctrl_date = t2.ctrldate
from src_table2 t2 where 
c.id_fkey = v.id_fkey;
 
Очень хотельсь бы понять best practice в идеологии dbt utils
для похожих операций, обновления стравочников и тп
 
