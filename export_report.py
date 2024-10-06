import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os




def make_report():
    print('Making report...')
    # ---- Load data ----
    PROJECT_DIR = ("/home/thangquang/Documents/CODE/sales-dataengineer-project")
    path = os.path.join(PROJECT_DIR, 'csv_folder')

    cate = pd.read_csv(os.path.join(path, 'category_quantity_product.csv'))
    city = pd.read_csv(os.path.join(path, 'city_rev_pro_num.csv'))
    by_time = pd.read_csv(os.path.join(path, 'ratio_on_off.csv'))
    source_df = pd.read_csv(os.path.join(path, 'source_rev_numberoder.csv'))
    best_sell_store = pd.read_csv(os.path.join(path, '10_best_selling_store.csv'))
    best_sell_product = pd.read_csv(os.path.join(path, '10_best_selling_prod.csv'))

    # --- Processing data ---
    month_name = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

    years = by_time['year'].unique()
    years = years[:-1]
    year_revenues = []
    year_number_orders = []

    for year in years:
        revenues = []
        number_orders = []
        for month in month_name:
            df = by_time[(by_time['year'] == year) & (by_time['month_name'] == month)]
            revenue = df['revenue_online'] + df['revenue_offline']
            number_order = df['number_order_online'] + df['number_order_offline']
            revenues.append(revenue.sum())  
            number_orders.append(number_order.sum()) 

        year_revenues.append(revenues)
        year_number_orders.append(number_orders)

    ratio_df = pd.DataFrame()
    for month in month_name:
        df_month = by_time[by_time['month_name'] == month]
        ratio_revenue_online = df_month['ratio_revenue_on'].sum()
        ratio_revenue_offline = df_month['ratio_revenue_off'].sum()  
        ratio_number_order_online = df_month['ratio_number_order_on'].sum()
        ratio_number_order_offline = df_month['ratio_number_order_off'].sum()
        new_df = pd.DataFrame({'month_name': month, 'ratio_revenue_online': ratio_revenue_online, 'ratio_revenue_offline': ratio_revenue_offline, 'ratio_number_order_online': ratio_number_order_online, 'ratio_number_order_offline': ratio_number_order_offline}, index=[0])
        ratio_df = pd.concat([ratio_df, new_df], ignore_index=True)  

    total_revenue_source = source_df['revenue'].sum()
    total_order_source = source_df['number_order'].sum()
    source_df['revenue_ratio'] = source_df['revenue'] / total_revenue_source
    source_df['order_ratio'] = source_df['number_order'] / total_order_source

    # --- Plotting ---
    fig = plt.figure(figsize=(12, 20)) 
    ax1 = plt.subplot2grid((5, 3), (0, 0), colspan=3)
    for i in range(len(years)):
        plt.plot(month_name, year_revenues[i], label='year ' + str(years[i]))
    plt.title('Revenue by month')
    plt.legend()

    ax2 = plt.subplot2grid((5, 3), (1, 0), colspan=3)
    for i in range(len(years)):
        plt.plot(month_name, year_number_orders[i], label='year ' + str(years[i]))
    plt.title('Number of orders')
    plt.legend()

    ax3 = plt.subplot2grid((5, 3), (2, 0), colspan=1)
    city.plot(ax=ax3, x='city_name', y=['revenue', 'profit'], kind='bar')
    plt.title('Revenue and Profit by City')

    ax4 = plt.subplot2grid((5, 3), (2, 1), colspan=1)
    cate.plot(ax=ax4, x='category_name', y=['quantity'], kind='bar')
    plt.title('Quantity of products by Category')

    ax5 = plt.subplot2grid((5, 3), (2, 2), colspan=1)

    plt.pie(source_df['revenue_ratio'], labels=source_df['link_name'], autopct='%1.1f%%')
    plt.title('Revenue Ratio by Source')

    ax6 = plt.subplot2grid((5, 3), (3, 0), colspan=1)
    best_sell_store.plot(ax=ax6, x='store_name', y=['revenue'], kind='barh')
    plt.title('Top 10 best selling store')

    ax7 = plt.subplot2grid((5, 3), (3, 1), colspan=1)
    best_sell_product.plot(ax=ax7, x='product_name', y=['quantity_sold'], kind='barh')
    plt.title('Top 10 best selling product')

    ax8 = plt.subplot2grid((5, 3), (3, 2), colspan=1)
    plt.pie(source_df['order_ratio'], labels=source_df['link_name'], autopct='%1.1f%%')
    plt.title('Order Ratio by Source')

    ax9 = plt.subplot2grid((5, 3), (4, 0), colspan=2)
    plt.bar(ratio_df['month_name'], ratio_df['ratio_revenue_online'], label='Online')
    plt.bar(ratio_df['month_name'], ratio_df['ratio_revenue_offline'], label='Offline', bottom=ratio_df['ratio_revenue_online'])
    plt.xticks(rotation=45)
    plt.title('Revenue Ratio by Channel')
    plt.legend()

    ax10 = plt.subplot2grid((5, 3), (4, 2), colspan=1)
    plt.bar(ratio_df['month_name'], ratio_df['ratio_number_order_online'], label='Online')
    plt.bar(ratio_df['month_name'], ratio_df['ratio_number_order_offline'], label='Offline', bottom=ratio_df['ratio_number_order_online'])
    plt.title('Order Ratio by Channel')
    plt.xticks(rotation=45)
    plt.legend()

    plt.tight_layout()
    # save figure
    fig.savefig(os.path.join(PROJECT_DIR, 'report.png'))
    print('Report has been saved to report.png')

if __name__ == '__main__':
    make_report()