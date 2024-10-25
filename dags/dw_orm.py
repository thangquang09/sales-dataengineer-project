from sqlalchemy import Column, Integer, String, Float, DECIMAL, Date, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

# Dimension Tables

class DimCity(Base):
    __tablename__ = 'dim_city'

    city_id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    stores = relationship("DimStore", back_populates="city")


class DimStore(Base):
    __tablename__ = 'dim_store'

    store_id = Column(Integer, primary_key=True)
    name = Column(String(255))
    city_id = Column(Integer, ForeignKey('dim_city.city_id'))
    
    city = relationship("DimCity", back_populates="stores")
    employees = relationship("DimEmployee", back_populates="store")
    sales_orders = relationship("FactSalesOrder", back_populates="store")
    productions = relationship("FactProduction", back_populates="store")


class DimEmployee(Base):
    __tablename__ = 'dim_employee'

    employee_id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    dob = Column(Date)
    identitynumber = Column(String(20))
    store_id = Column(Integer, ForeignKey('dim_store.store_id'))
    
    store = relationship("DimStore", back_populates="employees")
    sales_orders = relationship("FactSalesOrder", back_populates="employee")


class DimCustomer(Base):
    __tablename__ = 'dim_customer'

    customer_id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    email = Column(String(255), nullable=False)
    
    sales_orders = relationship("FactSalesOrder", back_populates="customer")


class DimSourceOnline(Base):
    __tablename__ = 'dim_source_online'

    source_online_id = Column(Integer, primary_key=True)
    link_name = Column(String(255), nullable=False)
    
    sales_orders = relationship("FactSalesOrder", back_populates="source_online")


class DimYear(Base):
    __tablename__ = 'dim_year'

    year_id = Column(Integer, primary_key=True)
    name = Column(String(50), nullable=False)
    
    months = relationship("DimMonth", back_populates="year")
    dates = relationship("DimDate", back_populates="year")


class DimQuarter(Base):
    __tablename__ = 'dim_quarter'

    quarter_id = Column(Integer, primary_key=True)
    name = Column(String(50), nullable=False)
    
    months = relationship("DimMonth", back_populates="quarter")


class DimMonth(Base):
    __tablename__ = 'dim_month'

    month_id = Column(Integer, primary_key=True)
    year_id = Column(Integer, ForeignKey('dim_year.year_id'))
    quarter_id = Column(Integer, ForeignKey('dim_quarter.quarter_id'))
    month = Column(Integer)
    name = Column(String(50), nullable=False)
    
    year = relationship("DimYear", back_populates="months")
    quarter = relationship("DimQuarter", back_populates="months")
    dates = relationship("DimDate", back_populates="month")


class DimDate(Base):
    __tablename__ = 'dim_date'

    date_id = Column(Integer, primary_key=True)
    month_id = Column(Integer, ForeignKey('dim_month.month_id'))
    year_id = Column(Integer, ForeignKey('dim_year.year_id'))
    date_name = Column(Date)
    
    month = relationship("DimMonth", back_populates="dates")
    year = relationship("DimYear", back_populates="dates")
    sales_orders = relationship("FactSalesOrder", back_populates="date")
    productions = relationship("FactProduction", back_populates="date")


class DimCategory(Base):
    __tablename__ = 'dim_category'

    category_id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    
    products = relationship("DimProduct", back_populates="category")


class DimBrand(Base):
    __tablename__ = 'dim_brand'

    brand_id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    
    products = relationship("DimProduct", back_populates="brand")


class DimProduct(Base):
    __tablename__ = 'dim_product'

    product_id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    description = Column(String(255))
    size = Column(Float)
    color = Column(String(50))
    brand_id = Column(Integer, ForeignKey('dim_brand.brand_id'))
    category_id = Column(Integer, ForeignKey('dim_category.category_id'))
    standardprice = Column(DECIMAL(15, 2))
    price = Column(DECIMAL(15, 2))
    
    brand = relationship("DimBrand", back_populates="products")
    category = relationship("DimCategory", back_populates="products")
    productions = relationship("FactProduction", back_populates="product")


# Fact Tables

class FactSalesOrder(Base):
    __tablename__ = 'fact_sales_order'

    id = Column(Integer, primary_key=True)
    date_id = Column(Integer, ForeignKey('dim_date.date_id'), nullable=False)
    source_online_id = Column(Integer, ForeignKey('dim_source_online.source_online_id'))
    customer_id = Column(Integer, ForeignKey('dim_customer.customer_id'), nullable=False)
    employee_id = Column(Integer, ForeignKey('dim_employee.employee_id'), nullable=False)
    store_id = Column(Integer, ForeignKey('dim_store.store_id'), nullable=False)
    revenue = Column(DECIMAL(15, 2))
    revenue_online = Column(DECIMAL(15, 2))
    revenue_offline = Column(DECIMAL(15, 2))
    standard_cost = Column(DECIMAL(15, 2))
    profit = Column(DECIMAL(15, 2))
    number_order = Column(Integer)
    number_order_online = Column(Integer)
    number_order_offline = Column(Integer)
    
    date = relationship("DimDate", back_populates="sales_orders")
    source_online = relationship("DimSourceOnline", back_populates="sales_orders")
    customer = relationship("DimCustomer", back_populates="sales_orders")
    employee = relationship("DimEmployee", back_populates="sales_orders")
    store = relationship("DimStore", back_populates="sales_orders")


class FactProduction(Base):
    __tablename__ = 'fact_production'

    id = Column(Integer, primary_key=True)
    date_id = Column(Integer, ForeignKey('dim_date.date_id'), nullable=False)
    store_id = Column(Integer, ForeignKey('dim_store.store_id'), nullable=False)
    product_id = Column(Integer, ForeignKey('dim_product.product_id'), nullable=False)
    quantity = Column(Integer)
    revenue = Column(DECIMAL(15, 2))
    profit = Column(DECIMAL(15, 2))
    
    date = relationship("DimDate", back_populates="productions")
    store = relationship("DimStore", back_populates="productions")
    product = relationship("DimProduct", back_populates="productions")

def setup_dw_database(engine):
    Base.metadata.create_all(engine)
