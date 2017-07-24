package uk.gov.digital.ho.proving.financialstatus.health

import org.slf4j.{Logger, LoggerFactory}
import org.springframework.beans.factory.annotation.{Autowired, Value}
import org.springframework.boot.actuate.health.{Health, HealthIndicator}
import org.springframework.stereotype.Component
import org.springframework.web.client.RestTemplate

import scala.util.{Failure, Success, Try}

/**
  * HealthIndicator contributing to the health check endpoint that is used for readiness checks.
  */
@Component
class BarclaysConnectionHealth @Autowired()(rest: RestTemplate,
                                            @Value("${barclays.balance.resource}") val balanceResource: String) extends HealthIndicator {

  val LOGGER: Logger = LoggerFactory.getLogger(classOf[BarclaysConnectionHealth])

  // todo Update for real Barclays API
  val bankHealthUrl = s"$balanceResource/01061600030000/balances?dateOfBirth=1975-10-10&toDate=2016-06-01&fromDate=2016-05-10"

  override def health(): Health = {

    val response = Try {
      rest.getForEntity(bankHealthUrl, classOf[String])
    }

    // todo check for failure status codes
    response match {
      case Success(_) => Health.up.withDetail("The Barclays Service is responding:", "OK").build
      case Failure(exception) => Health.down.withDetail("While trying to read Barclays Service, received :", exception.getMessage).build
    }
  }
}
