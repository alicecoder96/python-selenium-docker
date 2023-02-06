from selenium import webdriver
import os
import sys

chrome_options = webdriver.ChromeOptions()
driver = webdriver.Remote(
    command_executor="http://selenium:4444/wd/hub",
    options=chrome_options
)
driver.get("http://www.google.com")
print(driver.title)

FILENAME = os.path.join(os.path.dirname(os.path.abspath(__file__)), "images/screen.png")
# get width and height of the page
w = driver.execute_script("return document.body.scrollWidth;")
h = driver.execute_script("return document.body.scrollHeight;")

# set window size
driver.set_window_size(w,h)

# Get Screen Shot
driver.save_screenshot(FILENAME)

driver.quit()
