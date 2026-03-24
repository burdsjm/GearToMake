# GearToMake
This Lua script checks the inventory for specific items and reports their count. Here's a step-by-step breakdown:
The script first loads the mq module, which presumably provides various functions for interacting with the game environment.
The script defines a helper function check_and_report_item. This function takes an item name and a message format as parameters. It finds the count of the item in the inventory and if the count is more than 0, it sends a message (via mq.cmdf) to the game client with the count of the item. The message format is passed as an argument to the function.
The script creates a list of items to check, where each item is a table with two elements - the item name and the message format to use if the item is found.
The script then iterates over each item in the list. For each item, it calls the check_and_report_item function with the item name and message format. After checking each item, it waits for 2 seconds before checking the next item. The last item does not have a delay after it.
Finally, the script prints 'Done checking for gear to make' to the console.
In summary, this script reports the quantity of each specified item in the inventory. For each item found, it sends a message with the item count to the game client and waits for 2 seconds before checking the next item. This continues until all items in the list have been checked.
