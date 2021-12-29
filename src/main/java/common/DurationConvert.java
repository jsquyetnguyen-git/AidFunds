package common;

import java.sql.Date;
import java.util.concurrent.TimeUnit;

public class DurationConvert {
	public int duration(Date startDate, Date endDate) {
		long now = System.currentTimeMillis();
		Date today = new Date(now);
		long duration;
	
		if(endDate.before(today)) {
			return 0;
		}else if(startDate.before(today)) {
			duration = endDate.getTime() - today.getTime();
		    return (int) (TimeUnit.DAYS.convert(duration, TimeUnit.MILLISECONDS)+1);
		}else {
			duration = startDate.getTime() - today.getTime();
			return (int) (TimeUnit.DAYS.convert(duration, TimeUnit.MILLISECONDS)+1);
		}
	}
	
	public static void main(String[] args) {
		DurationConvert d = new DurationConvert();
		System.out.println(d.duration(Date.valueOf("2021-12-14"), Date.valueOf("2021-12-16")));
	}
}
