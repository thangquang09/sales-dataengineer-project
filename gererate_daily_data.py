from sqlalchemy import text

def generate_data(mysql_session, min_cus, max_cus, min_order, max_order):
    print("Generating data")
    print('----------------------------------')
    query = text(f"CALL generate_daily_data({min_cus}, {max_cus}, {min_order}, {max_order})")
    mysql_session.execute(query)
    mysql_session.commit()
    print("Generated data successfully")
    print('----------------------------------')
    