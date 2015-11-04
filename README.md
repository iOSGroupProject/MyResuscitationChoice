# MyResuscitationChoice

### About SQLite
The database that can be used by apps in iOS (and also used by iOS) is called SQLite, and it’s a relational database. It is contained in a C-library that is embedded to the app that is about to use it. Note that it does not consist of a separate service or daemon running on the background and attached to the app. On the contrary, the app runs it as an integral part of it. Nowadays, SQLite lives its third version, so it’s also commonly referred as SQLite 3.
###### Variables you can access
**UID** - Primary Key (auto-count)

**PrimaryFirstName** - The patient or cardholder's first name

**PrimaryLastName** -  The patient or cardholder's last name

**PrimaryPhoneNumber** - The patient or cardholder's phone number

**PrimaryDateOfBirth** - The patient or cardholder's date of birth 

**AdvancedDirectiveLocation** - Unique identifier for the video	

**AgentFirstName** - The health care agent's first name	

**AgentLastName** - The health care agent's last name

**AgentPhoneNumber** - The health care agent's phone number	

**AgentDateOfBirth** The health care agent's date of birth	

**UserChoice** - The resuscitation choice for the patient of cardholder 	
###### Connecting your class
```
#import "DBController.h"

        // Delete the selected record.
        // Find the record ID.
        int variableToUse = [[[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:0] intValue];

        // Prepare the query.
        NSString *query = [NSString stringWithFormat:@"your sql command and variable=%d", variableToUse];

        // Execute the query.
        [self.dbManager executeQuery:query];

        // Reload the table view.
        [self loadData];
```
