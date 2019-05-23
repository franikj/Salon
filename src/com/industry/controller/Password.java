package com.industry.controller;
	import java.util.Random;
	import java.util.Scanner;

	public class Password {

		static char[] generatePass(int length)
		{
			System.out.println(" your new password: ");
			String letters = "ABCDEFGHIJKLMNOPQRSTUVWZabcdefghijklmnopqestuvwxyz";
			String numbers="0123456789";
			String splChar = "!@#$%^&*";
			
			String pwd= letters+numbers+splChar;
			Random r = new Random();
			char[] newPass = new char [length];
			
			for(int i=0; i<length; i++){
				newPass[i]= pwd.charAt(r.nextInt(pwd.length()));
			}
			return newPass;
			
		}
		public static void main(String[] args) {
			// TODO Auto-generated method stub
			
			Scanner input = new Scanner(System.in);
			System.out.println("New password Y or N ?");
			String pass = input.next();
			input.close();
			//System.out.println();
			
			if("y".equalsIgnoreCase(pass)){
				System.out.println(generatePass(8));
			}
		

		}

	}

