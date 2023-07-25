import sqlite3
from models import Order

ORDERS = [
    {
        "metalId": 5,
        "styleId": 1,
        "sizeId": 2,
        "id": 1
    },
    {
        "metalId": 1,
        "styleId": 2,
        "sizeId": 3,
        "id": 2
    },
    {
        "metalId": 1,
        "styleId": 1,
        "sizeId": 1,
        "id": 3
    },
    {
        "metalId": 3,
        "styleId": 3,
        "sizeId": 2,
        "id": 4
    }
]


def get_all_orders():
    # Open a connection to the database
    with sqlite3.connect("./kneeldiamonds.sqlite3") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            o.id,
            o.metal_id,
            o.style_id,
            o.size_id
        FROM orders o
        """)

        # Initialize an empty list to hold all order representations
    orders = []

    # Convert rows of data into a Python list
    dataset = db_cursor.fetchall()

    # Iterate list of data returned from database
    for row in dataset:

        # Create an order instance from the current row.
        # Note that the database fields are specified in
        # exact order of the parameters defined in the
        # Animal class above.
        order = Order(row['id'], row['metal_id'], row['style_id'],
                      row['size_id'])

        orders.append(order.__dict__)

    return orders

# Function with a single parameter


def get_single_order(id):
    # Variable to hold the found order, if it exists
    requested_order = None

    # Iterate the ORDERS list above. Very similar to the
    # for..of loops you used in JavaScript.
    for order in ORDERS:
        # Dictionaries in Python use [] notation to find a key
        # instead of the dot notation that JavaScript used.
        if order["id"] == id:
            requested_order = order

    return requested_order


def create_order(order):
    # Get the id value of the last order in the list
    max_id = ORDERS[-1]["id"]

    # Add 1 to whatever that number is
    new_id = max_id + 1

    # Add an `id` property to the order dictionary
    order["id"] = new_id

    # Add the order dictionary to the list
    ORDERS.append(order)

    # Return the dictionary with `id` property added
    return order


def delete_order(id):
    # Initial -1 value for order index, in case one isn't found
    order_index = -1

    # Iterate the ORDERS list, but use enumerate() so that you
    # can access the index value of each item
    for index, order in enumerate(ORDERS):
        if order["id"] == id:
            # Found the order. Store the current index.
            order_index = index

    # If the order was found, use pop(int) to remove it from list
    if order_index >= 0:
        ORDERS.pop(order_index)


def update_order(id, new_order):
    # Iterate the ORDERS list, but use enumerate() so that
    # you can access the index value of each item.
    for index, order in enumerate(ORDERS):
        if order["id"] == id:
            new_order["id"] = id
            # Found the order. Update the value.
            ORDERS[index] = new_order
            break
