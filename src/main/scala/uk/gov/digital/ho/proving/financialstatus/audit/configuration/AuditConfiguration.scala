package uk.gov.digital.ho.proving.financialstatus.audit.configuration

import com.mongodb.MongoClient
import org.springframework.beans.factory.annotation.{Autowired, Value}
import org.springframework.boot.actuate.audit.AuditEventRepository
import org.springframework.context.annotation.{Bean, Configuration}
import org.springframework.data.mongodb.MongoDbFactory
import org.springframework.data.mongodb.core.{MongoOperations, MongoTemplate, SimpleMongoDbFactory}
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories
import uk.gov.digital.ho.proving.financialstatus.audit.{JsonLoggingNonPersistentAuditEventRepository, MongoAuditEventRepository}

@Configuration
@EnableMongoRepositories
class AuditConfiguration {

  @Value("${auditing.mongodb.databaseName}") private val auditingDatabaseName: String = null
  @Value("${auditing.mongodb.collectionName}") private val auditingCollectionName: String = null
  @Value("${auditing.deployment.name}") val deploymentName: String = null
  @Value("${auditing.deployment.namespace}") val deploymentNamespace: String = null

  @Bean
  def deploymentConfig(): DeploymentDetails = DeploymentDetails(deploymentName, deploymentNamespace)

  @Autowired
  @Bean
  def mongoDbFactory(mongoClient: MongoClient): MongoDbFactory = new SimpleMongoDbFactory(mongoClient, auditingDatabaseName)

  @Autowired
  @Bean
  def mongoOperations(mongoDbFactory: MongoDbFactory): MongoOperations = new MongoTemplate(mongoDbFactory)

  @Autowired
  @Bean
  def auditEventRepository(mongoOperations: MongoOperations): AuditEventRepository =
    new MongoAuditEventRepository(mongoOperations, auditingCollectionName)
    new JsonLoggingNonPersistentAuditEventRepository()

}
case class DeploymentDetails(deploymentName: String, deploymentNamespace: String)
