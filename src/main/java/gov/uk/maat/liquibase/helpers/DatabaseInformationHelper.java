package gov.uk.maat.liquibase.helpers;

import gov.uk.maat.liquibase.records.DatabaseInformation;

/***
 * This class is responsible for extracting the database information from environment variables.
 */
public class DatabaseInformationHelper {
    public DatabaseInformationHelper() {
    }

    public DatabaseInformation getDatabaseConnectionInformation() {
        String userName = System.getenv().getOrDefault("DB_USER", "LIQUIBASEADMIN");
        String userPass = System.getenv().getOrDefault("DB_PASS", "test");
        String databaseHost = System.getenv().getOrDefault("DB_HOST", "localhost");
        String databasePort = System.getenv().getOrDefault("DB_PORT", "1521");
        String databaseName = System.getenv().getOrDefault("DB_NAME", "FREE");

        return new DatabaseInformation(userName, userPass, databaseHost, databasePort, databaseName);
    }
}
