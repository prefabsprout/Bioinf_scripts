from selenium import webdriver
from Bio import SeqIO
import time

wolf_res = {}

fasta_input = '/home/stephen/Bioinformatics Institure/Biopractice №4/result_targetp[6].fasta'

for record in SeqIO.parse(fasta_input,
                          'fasta'):
    driver = webdriver.Firefox()
    driver.get('https://www.genscript.com/wolf-psort.html')
    textareq = driver.find_element_by_id('seq')
    textareq.send_keys(record.seq)
    radio = driver.find_element_by_css_selector("[value='Animal']")
    radio.click()
    button = driver.find_element_by_id("submit")
    driver.execute_script("return arguments[0].scrollIntoView(true);", button)
    button.click()
    button2 = driver.find_element_by_class_name('button-face')
    button2.click()
    time.sleep(10)
    button3 = driver.find_element_by_class_name('button-face')
    button3.click()
    time.sleep(5)
    new_window = driver.window_handles[1]
    driver.switch_to.window(new_window)
    time.sleep(5)
    value = driver.find_element_by_xpath('/html/body/table[2]/tbody/tr[3]/td[2]').text
    wolf_res[record.name] = value
    driver.quit()
print(wolf_res)
