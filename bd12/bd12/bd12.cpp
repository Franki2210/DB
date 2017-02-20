// bd12.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

bool FindText(ifstream & inputDB, string const & searchedUser)
{
	string line;
	bool found = false;
	cout << "Record id: ";
	string userInfo[8];
	int numberField = 0;
	bool quotes = false;

	while (getline(inputDB, line))
	{
		for (size_t i = 0; i < line.length(); ++i)
		{
			if (line[i] != ',')
			{
				if (line[i] == '"')
				{
					if (quotes == false) quotes = true;
					else quotes = false;
				}
				else
				{
					userInfo[numberField] += line[i];
				}
			}
			else
			{
				if (!quotes)
				{
					numberField++;
				}
			}
		}

		if (userInfo[4] == searchedUser)
		{
			cout << userInfo[0] << " ";
			found = true;
		}

		numberField = 0;
		for (size_t i = 0; i < 8; i++)
		{
			userInfo[i] = "";
		}
	}
	cout << endl;
	return found;
}

int main()
{
	ifstream inputFile("db.csv");

	if (!inputFile.is_open())
	{
		cout << "Failed to open db.csv for reading\n";
		return 1;
	}

	string searchedMan;
	cout << "Enter username: ";
	getline(cin, searchedMan);

	if (searchedMan.empty())
	{
		cout << "Search user is not specified\n";
		return 1;
	}

	if (!FindText(inputFile, searchedMan))
	{
		cout << "User not found\n";
		return 1;
	}

	inputFile.close();

	return 0;
}