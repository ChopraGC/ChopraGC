package com.gauravchopra.room_clr.roomclr;

import org.apache.logging.log4j.util.Strings;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class RoomClrApplication {

	public static void main(String[] args) {
		SpringApplication.run(RoomClrApplication.class, args);
	}

	@Bean
	public CommandLineRunner run() {
		return (args) ->  {
			for (int i=1; i<=100;i++) {
				String result = "";
				result += (i % 3) == 0 ? "Fizz" : "";
				result += (i % 5) == 0 ? "Buzz" : "";
				System.out.println(!Strings.isEmpty(result)? result : i);
			}
		};
	}

}
