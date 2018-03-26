package uk.gov.digital.ho.proving.financialstatus.domain

import java.time.LocalDate

import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import uk.gov.digital.ho.proving.financialstatus.bank.BarclaysBankService

@Service
class UserConsentStatusChecker @Autowired()(barclaysBankService: BarclaysBankService) {
  private val LOGGER = LoggerFactory.getLogger(classOf[UserConsentStatusChecker])

  def checkUserConsent(account: Account, fromDate: LocalDate, toDate: LocalDate, dob: LocalDate, userId: String): UserConsent = {

    LOGGER.debug("About to call BarclaysBankService.checkUserConsent")
    val consent: UserConsent = barclaysBankService.checkUserConsent(account, fromDate, toDate, dob, userId)
    LOGGER.debug("Returned from call BarclaysBankService.checkUserConsent")
    consent
  }

}
