package gov.uk.maat.liquibase;

import gov.uk.maat.liquibase.records.DatabaseInformation;
import liquibase.Liquibase;
import liquibase.Scope;
import liquibase.command.CommandScope;
import liquibase.command.core.UpdateCommandStep;
import liquibase.command.core.helpers.DbUrlConnectionCommandStep;
import liquibase.database.Database;
import liquibase.database.DatabaseFactory;
import liquibase.database.jvm.JdbcConnection;

import liquibase.resource.ClassLoaderResourceAccessor;
import liquibase.resource.FileSystemResourceAccessor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Map;

/***
 * This class is responsible for triggering the liquibase updates.
 */
public class LiquibaseRDSManager {

    private DatabaseInformation databaseInformation;

    /**
     * @param dbInfo The database information record.
     */
    public LiquibaseRDSManager(DatabaseInformation dbInfo) {
        this.databaseInformation = dbInfo;
    }

    public LiquibaseRDSManager() {
    }

    public void setDatabaseInformation(DatabaseInformation databaseInformation) {
        this.databaseInformation = databaseInformation;
    }

    public void runLiquibaseUpdate() throws Exception {
        assert this.databaseInformation != null;


        try (Connection conn = DriverManager.getConnection(
                this.databaseInformation.getDatabaseConnectionString(),
                this.databaseInformation.userName(),
                this.databaseInformation.password())) {

            Database dataBase = DatabaseFactory.getInstance().findCorrectDatabaseImplementation(new JdbcConnection(conn));
            Liquibase liquiBase = new liquibase.Liquibase(
                    "db/changelog-master.yaml", new ClassLoaderResourceAccessor(), dataBase);

            Map<String, Object> scopeObjects = new HashMap<>();
            scopeObjects.put(Scope.Attr.database.name(), liquiBase.getDatabase());
            scopeObjects.put(Scope.Attr.resourceAccessor.name(), liquiBase.getResourceAccessor());

            Scope.child(scopeObjects, () -> {
                CommandScope updateCommand = new CommandScope(UpdateCommandStep.COMMAND_NAME);
                updateCommand.addArgumentValue(DbUrlConnectionCommandStep.DATABASE_ARG, liquiBase.getDatabase());
                updateCommand.addArgumentValue(UpdateCommandStep.CHANGELOG_FILE_ARG, liquiBase.getChangeLogFile());
                updateCommand.execute();
            });
        }
    }
}