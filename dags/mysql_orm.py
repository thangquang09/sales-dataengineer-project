from sqlalchemy import Column, Integer, String, Float, DECIMAL, Date, ForeignKey, SmallInteger, Boolean
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

# Tạo Base cho ORM của MySQL
MySQLBase = declarative_base()

class MySQLProductionProduct(MySQLBase):
    __tablename__ = 'production_product'

    product_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    description = Column(String(255))
    size = Column(Float)
    color = Column(String(50))
    brand_id = Column(Integer, ForeignKey('production_brand.brand_id'))
    category_id = Column(Integer, ForeignKey('production_category.category_id'))
    standardPrice = Column(DECIMAL(15, 2))
    price = Column(DECIMAL(15, 2), nullable=False)
    createdDate = Column(Date)
    updatedDate = Column(Date, default=None)
    checkStatus = Column(Integer, default=0)

    # Quan hệ với bảng MySQLProductionBrand và MySQLProductionCategory
    brand = relationship("MySQLProductionBrand", backref="products")
    category = relationship("MySQLProductionCategory", backref="products")

class MySQLProductionBrand(MySQLBase):
    __tablename__ = 'production_brand'

    brand_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    createdDate = Column(Date, nullable=False)
    updatedDate = Column(Date, default=None)
    checkStatus = Column(Integer, default=0)

class MySQLProductionCategory(MySQLBase):
    __tablename__ = 'production_category'

    category_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    createdDate = Column(Date, nullable=False)
    updatedDate = Column(Date, default=None)
    checkStatus = Column(Integer, default=0)

class MySQLSalesStore(MySQLBase):
    __tablename__ = 'sales_store'

    store_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    city_id = Column(Integer, ForeignKey('sales_city.city_id'))
    createdDate = Column(Date, nullable=False)
    updatedDate = Column(Date, default=None)
    checkStatus = Column(Integer, default=0)

    city = relationship("MySQLSalesCity", backref="stores")

class MySQLSalesCity(MySQLBase):
    __tablename__ = 'sales_city'

    city_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    createdDate = Column(Date, nullable=False)
    updatedDate = Column(Date, default=None)
    checkStatus = Column(Integer, default=0)

class MySQLSalesEmployee(MySQLBase):
    __tablename__ = 'sales_employee'

    employee_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    dob = Column(Date)
    identityNumber = Column(String(20))
    store_id = Column(Integer, ForeignKey('sales_store.store_id'))
    createdDate = Column(Date, nullable=False)
    updatedDate = Column(Date, default=None)
    address = Column(String(255))
    checkStatus = Column(Integer, default=0)

    store = relationship("MySQLSalesStore", backref="employees")

class MySQLSalesCustomer(MySQLBase):
    __tablename__ = 'sales_customer'

    customer_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    email = Column(String(50), nullable=False)
    phone = Column(String(20))
    createdDate = Column(Date, nullable=False)
    updatedDate = Column(Date, default=None)
    checkStatus = Column(Integer, default=0)

class MySQLSalesOrder(MySQLBase):
    __tablename__ = 'sales_order'

    order_id = Column(Integer, primary_key=True, autoincrement=True)
    orderDate = Column(Date, nullable=False)
    total = Column(DECIMAL(15, 2), default=0)
    standardCost = Column(DECIMAL(15, 2))
    status = Column(SmallInteger)
    isOnline = Column(Boolean, nullable=False)
    source_online_id = Column(Integer, ForeignKey('sales_source_online.source_online_id'))
    customer_id = Column(Integer, ForeignKey('sales_customer.customer_id'))
    employee_id = Column(Integer, ForeignKey('sales_employee.employee_id'))
    store_id = Column(Integer, ForeignKey('sales_store.store_id'))
    createdDate = Column(Date, nullable=False)
    updatedDate = Column(Date, default=None)
    checkStatus = Column(Integer, default=0)

    customer = relationship("MySQLSalesCustomer", backref="orders")
    employee = relationship("MySQLSalesEmployee", backref="orders")
    store = relationship("MySQLSalesStore", backref="orders")
    source_online = relationship("MySQLSalesSourceOnline", backref="orders")

class MySQLSalesOrderDetail(MySQLBase):
    __tablename__ = 'sales_order_detail'

    order_detail_id = Column(Integer, primary_key=True, autoincrement=True)
    product_id = Column(Integer, ForeignKey('production_product.product_id'))
    quantity = Column(Integer)
    price = Column(DECIMAL(15, 2), default=0)
    total = Column(DECIMAL(15, 2), default=0)
    order_id = Column(Integer, ForeignKey('sales_order.order_id'))
    createdDate = Column(Date, nullable=False)
    updatedDate = Column(Date, default=None)
    checkStatus = Column(Integer, default=0)

    order = relationship("MySQLSalesOrder", backref="order_details")
    product = relationship("MySQLProductionProduct", backref="order_details")

class MySQLSalesSourceOnline(MySQLBase):
    __tablename__ = 'sales_source_online'

    source_online_id = Column(Integer, primary_key=True, autoincrement=True)
    link_name = Column(String(255), nullable=False)
    createdDate = Column(Date, nullable=False)
    updatedDate = Column(Date, default=None)
    checkStatus = Column(Integer, default=0)

def setup_mysql_database(engine):
    MySQLBase.metadata.create_all(engine)