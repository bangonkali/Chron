Chron is a Hardware CRON-LIKE Scheduler
================================
Purpose  
* Scheduling of AC Sockets using a modified CRON syntax.
* Input of Schedule can be from the Removable Serially connected LCD Keypad Module or through the PC Interface via USB.
* Schedule will be stored on the PIC18F4550 EEPROM if the size fits. Others will be stored on a memory card.
* An SD Card Slot can be added using via SPI to the PIC18F4550.

<pre>
# .------------------------------- minute (0 - 59)
# |   .--------------------------- hour (0 - 23)
# |   |   .----------------------- day of month (1 - 31)
# |   |   |   .------------------- month (1 - 12) OR jan,feb,mar,apr ...
# |   |   |   |   .--------------- day of week (0 - 7)
# |   |   |   |   |   .----------- year (2012-2100) depends on the integrated real time clock ic
# |   |   |   |   |   |   .------- off or on 
# |   |   |   |   |   |   |   .--- device id (0-255) limited by the available pins per scheduler 
# |   |   |   |   |   |   |   |
# *   *   *   *   *   *   *   *
# 1   2   3   4   5   6   7   8
</pre>

Examples
<table>
  <tr>
    <td>Every 1 minute turn off device switch 2</td>
    <td><pre>* * * * * * 0 2</pre></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><pre>*/1 * * * * * 0 2</pre></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><pre>0-59 * * * * * 0 2</pre></td>
  </tr>
  <tr>
    <td>Every Friday 12 PM Turn off switch 3</td>
    <td><pre>0 12 * * 6 * 0 3</pre></td>
  </tr>
  <tr>
    <td>Every Day 6 AM Turn off switch 1</td>
    <td><pre>0 6 * * * * 0 1</pre></td>
  </tr>
  <tr>
    <td>Every Day 6 AM Turn on switch 1</td>
    <td><pre>0 6 * * * * 1 1</pre></td>
  </tr>
</table>
