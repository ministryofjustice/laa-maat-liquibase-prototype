package gov.uk.maat.liquibase;

import gov.uk.maat.liquibase.helpers.DatabaseInformationHelper;

public class Main {
    public static void main(String[] args) throws Exception {
        DatabaseInformationHelper dbHelper = new DatabaseInformationHelper();
        LiquibaseRDSManager liquibaseManager = new LiquibaseRDSManager(dbHelper.getDatabaseConnectionInformation());
        liquibaseManager.runLiquibaseUpdate();
    }
}
