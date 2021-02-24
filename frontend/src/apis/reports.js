import axios from 'axios';
import { reportsIndex } from '../urls/index'

export const fetchReports = () => {
  return axios.get(reportsIndex)
  .then(res => {
    return res.data
  })
  .catch((e) => console.error(e))
}
