package gov.uk.maat.liquibase.lambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import gov.uk.maat.liquibase.LiquibaseRDSManager;
import gov.uk.maat.liquibase.enums.LambdaStatus;
import gov.uk.maat.liquibase.helpers.DatabaseInformationHelper;

import java.util.Map;

/***
 * This class is lambda handler that will be used when the function is triggered on AWS.
 */
public class LiquibaseLambdaHandler implements RequestHandler<Map<String, Object>, Object> {
    private DatabaseInformationHelper dbHelper;
    private LiquibaseRDSManager liquibaseRDSManager;

    public LiquibaseLambdaHandler(DatabaseInformationHelper dbHelper, LiquibaseRDSManager liquibaseRDSManager) {
        this.dbHelper = dbHelper;
        this.liquibaseRDSManager = liquibaseRDSManager;
    }

    public LiquibaseLambdaHandler() {
        this.dbHelper = new DatabaseInformationHelper();
        this.liquibaseRDSManager = new LiquibaseRDSManager();
    }

    @Override
    public Object handleRequest(Map<String, Object> input, Context context) {
        LambdaLogger logger = context.getLogger();

        liquibaseRDSManager.setDatabaseInformation(dbHelper.getDatabaseConnectionInformation());

        try {
            logger.log("[INFO] Running Liquibase command");
            liquibaseRDSManager.runLiquibaseUpdate();
        } catch (Exception exception) {
            logger.log(String.format("[ERROR] Exception - %s", exception.getMessage()));
            return LambdaStatus.FAILED;
        }

        logger.log("[INFO] Liquibase command completed successfully.");
        return LambdaStatus.SUCCESS;
    }


}