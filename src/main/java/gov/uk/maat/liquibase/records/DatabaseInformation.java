package gov.uk.maat.liquibase.records;

public record DatabaseInformation(
        String userName, String password, String databaseHost, String databasePort, String databaseName) {

    public static final String ORACLE_URL_TEMPLATE = "jdbc:oracle:thin:@%s:%s:%s";

    public String getDatabaseConnectionString() {
        return String.format(ORACLE_URL_TEMPLATE, databaseHost, databasePort, databaseName);
    }
}
