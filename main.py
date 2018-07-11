from datetime import datetime
import time
import schedule


def printer():
    now = datetime.now()
    print('Development Test Script  //  Joel Almeida ')
    print(f'This script ran at: {now}')


if __name__ == '__main__':



    # TODO: Altert time must be updated , the current value is for testing purposes.
    schedule.every(1).minutes.do(printer)

    while True:
        schedule.run_pending()
        time.sleep(1)
