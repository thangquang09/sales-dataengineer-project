from sqlalchemy import Column, Integer, String, Float, DECIMAL, Date, Boolean, SmallInteger
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.sql import func

# Tạo Base cho ORM của PostgreSQL (staging area)
PostgresBase = declarative_base()

class ControlColumnsMixin(object):  # Kế thừa từ object
    insertdate = Column(Date, default=func.current_date())
    updatedate = Column(Date)
    sourcesystem = Column(String(50), default='MySQL')
    isprocessed = Column(Boolean, default=False)

class PostgresProductionProduct(PostgresBase, ControlColumnsMixin):
    __tablename__ = 'production_product'

    product_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    description = Column(String(255))
    size = Column(Float)
    color = Column(String(50))
    brand_id = Column(Integer)
    category_id = Column(Integer)
    standardprice = Column(DECIMAL(15, 2))
    price = Column(DECIMAL(15, 2), nullable=False)
    createddate = Column(Date)
    updateddate = Column(Date)

class PostgresProductionBrand(PostgresBase, ControlColumnsMixin):
    __tablename__ = 'production_brand'

    brand_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    createddate = Column(Date, nullable=False)
    updateddate = Column(Date)

class PostgresProductionCategory(PostgresBase, ControlColumnsMixin):
    __tablename__ = 'production_category'

    category_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    createddate = Column(Date, nullable=False)
    updateddate = Column(Date)

class PostgresSalesStore(PostgresBase, ControlColumnsMixin):
    __tablename__ = 'sales_store'

    store_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    city_id = Column(Integer)
    createddate = Column(Date, nullable=False)
    updateddate = Column(Date)

class PostgresSalesCity(PostgresBase, ControlColumnsMixin):
    __tablename__ = 'sales_city'

    city_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    createddate = Column(Date, nullable=False)
    updateddate = Column(Date)

class PostgresSalesEmployee(PostgresBase, ControlColumnsMixin):
    __tablename__ = 'sales_employee'

    employee_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    dob = Column(Date)
    identitynumber = Column(String(20))
    store_id = Column(Integer)
    createddate = Column(Date, nullable=False)
    updateddate = Column(Date)
    address = Column(String(255))

class PostgresSalesCustomer(PostgresBase, ControlColumnsMixin):
    __tablename__ = 'sales_customer'

    customer_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    email = Column(String(50), nullable=False)
    phone = Column(String(20))
    createddate = Column(Date, nullable=False)
    updateddate = Column(Date)

class PostgresSalesOrder(PostgresBase, ControlColumnsMixin):
    __tablename__ = 'sales_order'

    order_id = Column(Integer, primary_key=True, autoincrement=True)
    orderdate = Column(Date, nullable=False)
    total = Column(DECIMAL(15, 2), default=0)
    standardcost = Column(DECIMAL(15, 2))
    status = Column(SmallInteger)
    isonline = Column(Boolean, nullable=False)
    source_online_id = Column(Integer)
    customer_id = Column(Integer)
    employee_id = Column(Integer)
    store_id = Column(Integer)
    createddate = Column(Date, nullable=False)
    updateddate = Column(Date)

class PostgresSalesOrderDetail(PostgresBase, ControlColumnsMixin):
    __tablename__ = 'sales_order_detail'

    order_detail_id = Column(Integer, primary_key=True, autoincrement=True)
    product_id = Column(Integer)
    quantity = Column(Integer)
    price = Column(DECIMAL(15, 2), default=0)
    total = Column(DECIMAL(15, 2), default=0)
    order_id = Column(Integer)
    createddate = Column(Date, nullable=False)
    updateddate = Column(Date)

class PostgresSalesSourceOnline(PostgresBase, ControlColumnsMixin):
    __tablename__ = 'sales_source_online'

    source_online_id = Column(Integer, primary_key=True, autoincrement=True)
    link_name = Column(String(255), nullable=False)
    createddate = Column(Date, nullable=False)
    updateddate = Column(Date)

def setup_postgres_database(engine):
    PostgresBase.metadata.create_all(engine)